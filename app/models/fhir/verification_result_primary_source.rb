module FHIR
  # fhir/verification_result_primary_source.rb
  class VerificationResultPrimarySource < BackboneElement
    include Mongoid::Document
    embeds_one :who, class_name: 'Reference'
    embeds_many :type, class_name: 'CodeableConcept'
    embeds_many :communicationMethod, class_name: 'CodeableConcept'
    embeds_one :validationStatus, class_name: 'CodeableConcept'
    embeds_one :validationDate, class_name: 'PrimitiveDateTime'
    embeds_one :canPushUpdates, class_name: 'CodeableConcept'
    embeds_many :pushTypeAvailable, class_name: 'CodeableConcept'

    def self.transform_json(json_hash, target = VerificationResultPrimarySource.new)
      result = self.superclass.transform_json(json_hash, target)
      result['who'] = Reference.transform_json(json_hash['who']) unless json_hash['who'].nil?      
      result['type'] = json_hash['type'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['type'].nil?
      result['communicationMethod'] = json_hash['communicationMethod'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['communicationMethod'].nil?
      result['validationStatus'] = CodeableConcept.transform_json(json_hash['validationStatus']) unless json_hash['validationStatus'].nil?      
      result['validationDate'] = PrimitiveDateTime.transform_json(json_hash['validationDate'], json_hash['_validationDate']) unless json_hash['validationDate'].nil?      
      result['canPushUpdates'] = CodeableConcept.transform_json(json_hash['canPushUpdates']) unless json_hash['canPushUpdates'].nil?      
      result['pushTypeAvailable'] = json_hash['pushTypeAvailable'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['pushTypeAvailable'].nil?

      result
    end
  end
end
