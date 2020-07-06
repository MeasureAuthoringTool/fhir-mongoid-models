module FHIR
  # fhir/medication_statement.rb
  class MedicationStatement < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'Identifier'
    embeds_many :basedOn, class_name: 'Reference'
    embeds_many :partOf, class_name: 'Reference'
    embeds_one :status, class_name: 'MedicationStatementStatus'
    embeds_many :statusReason, class_name: 'CodeableConcept'
    embeds_one :category, class_name: 'CodeableConcept'
    embeds_one :medicationCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :medicationReference, class_name: 'Reference'
    embeds_one :subject, class_name: 'Reference'
    embeds_one :context, class_name: 'Reference'
    embeds_one :effectiveDateTime, class_name: 'PrimitiveDateTime'
    embeds_one :effectivePeriod, class_name: 'Period'
    embeds_one :dateAsserted, class_name: 'PrimitiveDateTime'
    embeds_one :informationSource, class_name: 'Reference'
    embeds_many :derivedFrom, class_name: 'Reference'
    embeds_many :reasonCode, class_name: 'CodeableConcept'
    embeds_many :reasonReference, class_name: 'Reference'
    embeds_many :note, class_name: 'Annotation'
    embeds_many :dosage, class_name: 'Dosage'

    def self.transform_json(json_hash, target = MedicationStatement.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['basedOn'] = json_hash['basedOn'].map { |var| Reference.transform_json(var) } unless json_hash['basedOn'].nil?
      result['partOf'] = json_hash['partOf'].map { |var| Reference.transform_json(var) } unless json_hash['partOf'].nil?
      result['status'] = MedicationStatementStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['statusReason'] = json_hash['statusReason'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['statusReason'].nil?
      result['category'] = CodeableConcept.transform_json(json_hash['category']) unless json_hash['category'].nil?      
      result['medicationCodeableConcept'] = CodeableConcept.transform_json(json_hash['medicationCodeableConcept']) unless json_hash['medicationCodeableConcept'].nil?      
      result['medicationReference'] = Reference.transform_json(json_hash['medicationReference']) unless json_hash['medicationReference'].nil?      
      result['subject'] = Reference.transform_json(json_hash['subject']) unless json_hash['subject'].nil?      
      result['context'] = Reference.transform_json(json_hash['context']) unless json_hash['context'].nil?      
      result['effectiveDateTime'] = PrimitiveDateTime.transform_json(json_hash['effectiveDateTime'], json_hash['_effectiveDateTime']) unless json_hash['effectiveDateTime'].nil?      
      result['effectivePeriod'] = Period.transform_json(json_hash['effectivePeriod']) unless json_hash['effectivePeriod'].nil?      
      result['dateAsserted'] = PrimitiveDateTime.transform_json(json_hash['dateAsserted'], json_hash['_dateAsserted']) unless json_hash['dateAsserted'].nil?      
      result['informationSource'] = Reference.transform_json(json_hash['informationSource']) unless json_hash['informationSource'].nil?      
      result['derivedFrom'] = json_hash['derivedFrom'].map { |var| Reference.transform_json(var) } unless json_hash['derivedFrom'].nil?
      result['reasonCode'] = json_hash['reasonCode'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['reasonCode'].nil?
      result['reasonReference'] = json_hash['reasonReference'].map { |var| Reference.transform_json(var) } unless json_hash['reasonReference'].nil?
      result['note'] = json_hash['note'].map { |var| Annotation.transform_json(var) } unless json_hash['note'].nil?
      result['dosage'] = json_hash['dosage'].map { |var| Dosage.transform_json(var) } unless json_hash['dosage'].nil?

      result
    end
  end
end
