module FHIR
  # fhir/medication_administration.rb
  class MedicationAdministration < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationAdministration'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_many :instantiates, class_name: 'PrimitiveUri'
    embeds_many :partOf, class_name: 'Reference'
    embeds_one :status, class_name: 'MedicationAdministrationStatus'
    embeds_many :statusReason, class_name: 'CodeableConcept'
    embeds_one :category, class_name: 'CodeableConcept'
    embeds_one :medicationCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :medicationReference, class_name: 'Reference'
    embeds_one :subject, class_name: 'Reference'
    embeds_one :context, class_name: 'Reference'
    embeds_many :supportingInformation, class_name: 'Reference'
    embeds_one :effectiveDateTime, class_name: 'PrimitiveDateTime'
    embeds_one :effectivePeriod, class_name: 'Period'
    embeds_many :performer, class_name: 'MedicationAdministrationPerformer'
    embeds_many :reasonCode, class_name: 'CodeableConcept'
    embeds_many :reasonReference, class_name: 'Reference'
    embeds_one :request, class_name: 'Reference'
    embeds_many :device, class_name: 'Reference'
    embeds_many :note, class_name: 'Annotation'
    embeds_one :dosage, class_name: 'MedicationAdministrationDosage'
    embeds_many :eventHistory, class_name: 'Reference'

    def self.transform_json(json_hash, target=MedicationAdministration.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['instantiates'] = json_hash['instantiates'].each_with_index.map do |var, i|
        extension_hash = json_hash['_instantiates'] && json_hash['_instantiates'][i]
        PrimitiveUri.transform_json(var, extension_hash)
      end unless json_hash['instantiates'].nil?
      result['partOf'] = json_hash['partOf'].map { |var| Reference.transform_json(var) } unless json_hash['partOf'].nil?
      result['status'] = MedicationAdministrationStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['statusReason'] = json_hash['statusReason'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['statusReason'].nil?
      result['category'] = CodeableConcept.transform_json(json_hash['category']) unless json_hash['category'].nil?      
      result['medicationCodeableConcept'] = CodeableConcept.transform_json(json_hash['medicationCodeableConcept']) unless json_hash['medicationCodeableConcept'].nil?      
      result['medicationReference'] = Reference.transform_json(json_hash['medicationReference']) unless json_hash['medicationReference'].nil?      
      result['subject'] = Reference.transform_json(json_hash['subject']) unless json_hash['subject'].nil?      
      result['context'] = Reference.transform_json(json_hash['context']) unless json_hash['context'].nil?      
      result['supportingInformation'] = json_hash['supportingInformation'].map { |var| Reference.transform_json(var) } unless json_hash['supportingInformation'].nil?
      result['effectiveDateTime'] = PrimitiveDateTime.transform_json(json_hash['effectiveDateTime'], json_hash['_effectiveDateTime']) unless json_hash['effectiveDateTime'].nil?      
      result['effectivePeriod'] = Period.transform_json(json_hash['effectivePeriod']) unless json_hash['effectivePeriod'].nil?      
      result['performer'] = json_hash['performer'].map { |var| MedicationAdministrationPerformer.transform_json(var) } unless json_hash['performer'].nil?
      result['reasonCode'] = json_hash['reasonCode'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['reasonCode'].nil?
      result['reasonReference'] = json_hash['reasonReference'].map { |var| Reference.transform_json(var) } unless json_hash['reasonReference'].nil?
      result['request'] = Reference.transform_json(json_hash['request']) unless json_hash['request'].nil?      
      result['device'] = json_hash['device'].map { |var| Reference.transform_json(var) } unless json_hash['device'].nil?
      result['note'] = json_hash['note'].map { |var| Annotation.transform_json(var) } unless json_hash['note'].nil?
      result['dosage'] = MedicationAdministrationDosage.transform_json(json_hash['dosage']) unless json_hash['dosage'].nil?      
      result['eventHistory'] = json_hash['eventHistory'].map { |var| Reference.transform_json(var) } unless json_hash['eventHistory'].nil?

      result
    end
  end
end
