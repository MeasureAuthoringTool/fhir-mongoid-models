module FHIR
  # fhir/verification_result.rb
  class VerificationResult < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'VerificationResult'
    embeds_many :target, class_name: 'Reference'
    embeds_many :targetLocation, class_name: 'PrimitiveString'
    embeds_one :need, class_name: 'CodeableConcept'
    embeds_one :status, class_name: 'Status'
    embeds_one :statusDate, class_name: 'PrimitiveDateTime'
    embeds_one :validationType, class_name: 'CodeableConcept'
    embeds_many :validationProcess, class_name: 'CodeableConcept'
    embeds_one :frequency, class_name: 'Timing'
    embeds_one :lastPerformed, class_name: 'PrimitiveDateTime'
    embeds_one :nextScheduled, class_name: 'PrimitiveDate'
    embeds_one :failureAction, class_name: 'CodeableConcept'
    embeds_many :primarySource, class_name: 'VerificationResultPrimarySource'
    embeds_one :attestation, class_name: 'VerificationResultAttestation'
    embeds_many :validator, class_name: 'VerificationResultValidator'

    def self.transform_json(json_hash)
      result = VerificationResult.new
      result['target'] = json_hash['target'].map { |var| Reference.transform_json(var) } unless json_hash['target'].nil?
      result['targetLocation'] = json_hash['targetLocation'].each_with_index.map do |var, i|
        extension_hash = json_hash['_targetLocation'] && json_hash['_targetLocation'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['targetLocation'].nil?
      result['need'] = CodeableConcept.transform_json(json_hash['need']) unless json_hash['need'].nil?      
      result['status'] = Status.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['statusDate'] = PrimitiveDateTime.transform_json(json_hash['statusDate'], json_hash['_statusDate']) unless json_hash['statusDate'].nil?      
      result['validationType'] = CodeableConcept.transform_json(json_hash['validationType']) unless json_hash['validationType'].nil?      
      result['validationProcess'] = json_hash['validationProcess'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['validationProcess'].nil?
      result['frequency'] = Timing.transform_json(json_hash['frequency']) unless json_hash['frequency'].nil?      
      result['lastPerformed'] = PrimitiveDateTime.transform_json(json_hash['lastPerformed'], json_hash['_lastPerformed']) unless json_hash['lastPerformed'].nil?      
      result['nextScheduled'] = PrimitiveDate.transform_json(json_hash['nextScheduled'], json_hash['_nextScheduled']) unless json_hash['nextScheduled'].nil?      
      result['failureAction'] = CodeableConcept.transform_json(json_hash['failureAction']) unless json_hash['failureAction'].nil?      
      result['primarySource'] = json_hash['primarySource'].map { |var| VerificationResultPrimarySource.transform_json(var) } unless json_hash['primarySource'].nil?
      result['attestation'] = VerificationResultAttestation.transform_json(json_hash['attestation']) unless json_hash['attestation'].nil?      
      result['validator'] = json_hash['validator'].map { |var| VerificationResultValidator.transform_json(var) } unless json_hash['validator'].nil?

      result
    end
  end
end
