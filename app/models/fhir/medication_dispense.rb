module FHIR
  # fhir/medication_dispense.rb
  class MedicationDispense < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'Identifier'
    embeds_many :partOf, class_name: 'Reference'
    embeds_one :status, class_name: 'MedicationDispenseStatus'
    embeds_one :statusReasonCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :statusReasonReference, class_name: 'Reference'
    embeds_one :category, class_name: 'CodeableConcept'
    embeds_one :medicationCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :medicationReference, class_name: 'Reference'
    embeds_one :subject, class_name: 'Reference'
    embeds_one :context, class_name: 'Reference'
    embeds_many :supportingInformation, class_name: 'Reference'
    embeds_many :performer, class_name: 'MedicationDispensePerformer'
    embeds_one :location, class_name: 'Reference'
    embeds_many :authorizingPrescription, class_name: 'Reference'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :quantity, class_name: 'SimpleQuantity'
    embeds_one :daysSupply, class_name: 'SimpleQuantity'
    embeds_one :whenPrepared, class_name: 'PrimitiveDateTime'
    embeds_one :whenHandedOver, class_name: 'PrimitiveDateTime'
    embeds_one :destination, class_name: 'Reference'
    embeds_many :receiver, class_name: 'Reference'
    embeds_many :note, class_name: 'Annotation'
    embeds_many :dosageInstruction, class_name: 'Dosage'
    embeds_one :substitution, class_name: 'MedicationDispenseSubstitution'
    embeds_many :detectedIssue, class_name: 'Reference'
    embeds_many :eventHistory, class_name: 'Reference'

    def self.transform_json(json_hash, target = MedicationDispense.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['partOf'] = json_hash['partOf'].map { |var| Reference.transform_json(var) } unless json_hash['partOf'].nil?
      result['status'] = MedicationDispenseStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['statusReasonCodeableConcept'] = CodeableConcept.transform_json(json_hash['statusReasonCodeableConcept']) unless json_hash['statusReasonCodeableConcept'].nil?      
      result['statusReasonReference'] = Reference.transform_json(json_hash['statusReasonReference']) unless json_hash['statusReasonReference'].nil?      
      result['category'] = CodeableConcept.transform_json(json_hash['category']) unless json_hash['category'].nil?      
      result['medicationCodeableConcept'] = CodeableConcept.transform_json(json_hash['medicationCodeableConcept']) unless json_hash['medicationCodeableConcept'].nil?      
      result['medicationReference'] = Reference.transform_json(json_hash['medicationReference']) unless json_hash['medicationReference'].nil?      
      result['subject'] = Reference.transform_json(json_hash['subject']) unless json_hash['subject'].nil?      
      result['context'] = Reference.transform_json(json_hash['context']) unless json_hash['context'].nil?      
      result['supportingInformation'] = json_hash['supportingInformation'].map { |var| Reference.transform_json(var) } unless json_hash['supportingInformation'].nil?
      result['performer'] = json_hash['performer'].map { |var| MedicationDispensePerformer.transform_json(var) } unless json_hash['performer'].nil?
      result['location'] = Reference.transform_json(json_hash['location']) unless json_hash['location'].nil?      
      result['authorizingPrescription'] = json_hash['authorizingPrescription'].map { |var| Reference.transform_json(var) } unless json_hash['authorizingPrescription'].nil?
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['quantity'] = SimpleQuantity.transform_json(json_hash['quantity']) unless json_hash['quantity'].nil?      
      result['daysSupply'] = SimpleQuantity.transform_json(json_hash['daysSupply']) unless json_hash['daysSupply'].nil?      
      result['whenPrepared'] = PrimitiveDateTime.transform_json(json_hash['whenPrepared'], json_hash['_whenPrepared']) unless json_hash['whenPrepared'].nil?      
      result['whenHandedOver'] = PrimitiveDateTime.transform_json(json_hash['whenHandedOver'], json_hash['_whenHandedOver']) unless json_hash['whenHandedOver'].nil?      
      result['destination'] = Reference.transform_json(json_hash['destination']) unless json_hash['destination'].nil?      
      result['receiver'] = json_hash['receiver'].map { |var| Reference.transform_json(var) } unless json_hash['receiver'].nil?
      result['note'] = json_hash['note'].map { |var| Annotation.transform_json(var) } unless json_hash['note'].nil?
      result['dosageInstruction'] = json_hash['dosageInstruction'].map { |var| Dosage.transform_json(var) } unless json_hash['dosageInstruction'].nil?
      result['substitution'] = MedicationDispenseSubstitution.transform_json(json_hash['substitution']) unless json_hash['substitution'].nil?      
      result['detectedIssue'] = json_hash['detectedIssue'].map { |var| Reference.transform_json(var) } unless json_hash['detectedIssue'].nil?
      result['eventHistory'] = json_hash['eventHistory'].map { |var| Reference.transform_json(var) } unless json_hash['eventHistory'].nil?

      result
    end
  end
end
