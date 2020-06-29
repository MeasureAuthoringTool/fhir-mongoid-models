module FHIR
  # fhir/medication_request.rb
  class MedicationRequest < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationRequest'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'MedicationRequestStatus'
    embeds_one :statusReason, class_name: 'CodeableConcept'
    embeds_one :intent, class_name: 'MedicationRequestIntent'
    embeds_many :category, class_name: 'CodeableConcept'
    embeds_one :priority, class_name: 'MedicationRequestPriority'
    embeds_one :doNotPerform, class_name: 'PrimitiveBoolean'
    embeds_one :reportedBoolean, class_name: 'PrimitiveBoolean'
    embeds_one :reportedReference, class_name: 'Reference'
    embeds_one :medicationCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :medicationReference, class_name: 'Reference'
    embeds_one :subject, class_name: 'Reference'
    embeds_one :encounter, class_name: 'Reference'
    embeds_many :supportingInformation, class_name: 'Reference'
    embeds_one :authoredOn, class_name: 'PrimitiveDateTime'
    embeds_one :requester, class_name: 'Reference'
    embeds_one :performer, class_name: 'Reference'
    embeds_one :performerType, class_name: 'CodeableConcept'
    embeds_one :recorder, class_name: 'Reference'
    embeds_many :reasonCode, class_name: 'CodeableConcept'
    embeds_many :reasonReference, class_name: 'Reference'
    embeds_many :instantiatesCanonical, class_name: 'PrimitiveCanonical'
    embeds_many :instantiatesUri, class_name: 'PrimitiveUri'
    embeds_many :basedOn, class_name: 'Reference'
    embeds_one :groupIdentifier, class_name: 'Identifier'
    embeds_one :courseOfTherapyType, class_name: 'CodeableConcept'
    embeds_many :insurance, class_name: 'Reference'
    embeds_many :note, class_name: 'Annotation'
    embeds_many :dosageInstruction, class_name: 'Dosage'
    embeds_one :dispenseRequest, class_name: 'MedicationRequestDispenseRequest'
    embeds_one :substitution, class_name: 'MedicationRequestSubstitution'
    embeds_one :priorPrescription, class_name: 'Reference'
    embeds_many :detectedIssue, class_name: 'Reference'
    embeds_many :eventHistory, class_name: 'Reference'

    def self.transform_json(json_hash, target=MedicationRequest.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['status'] = MedicationRequestStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['statusReason'] = CodeableConcept.transform_json(json_hash['statusReason']) unless json_hash['statusReason'].nil?      
      result['intent'] = MedicationRequestIntent.transform_json(json_hash['intent']) unless json_hash['intent'].nil?      
      result['category'] = json_hash['category'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['category'].nil?
      result['priority'] = MedicationRequestPriority.transform_json(json_hash['priority']) unless json_hash['priority'].nil?      
      result['doNotPerform'] = PrimitiveBoolean.transform_json(json_hash['doNotPerform'], json_hash['_doNotPerform']) unless json_hash['doNotPerform'].nil?      
      result['reportedBoolean'] = PrimitiveBoolean.transform_json(json_hash['reportedBoolean'], json_hash['_reportedBoolean']) unless json_hash['reportedBoolean'].nil?      
      result['reportedReference'] = Reference.transform_json(json_hash['reportedReference']) unless json_hash['reportedReference'].nil?      
      result['medicationCodeableConcept'] = CodeableConcept.transform_json(json_hash['medicationCodeableConcept']) unless json_hash['medicationCodeableConcept'].nil?      
      result['medicationReference'] = Reference.transform_json(json_hash['medicationReference']) unless json_hash['medicationReference'].nil?      
      result['subject'] = Reference.transform_json(json_hash['subject']) unless json_hash['subject'].nil?      
      result['encounter'] = Reference.transform_json(json_hash['encounter']) unless json_hash['encounter'].nil?      
      result['supportingInformation'] = json_hash['supportingInformation'].map { |var| Reference.transform_json(var) } unless json_hash['supportingInformation'].nil?
      result['authoredOn'] = PrimitiveDateTime.transform_json(json_hash['authoredOn'], json_hash['_authoredOn']) unless json_hash['authoredOn'].nil?      
      result['requester'] = Reference.transform_json(json_hash['requester']) unless json_hash['requester'].nil?      
      result['performer'] = Reference.transform_json(json_hash['performer']) unless json_hash['performer'].nil?      
      result['performerType'] = CodeableConcept.transform_json(json_hash['performerType']) unless json_hash['performerType'].nil?      
      result['recorder'] = Reference.transform_json(json_hash['recorder']) unless json_hash['recorder'].nil?      
      result['reasonCode'] = json_hash['reasonCode'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['reasonCode'].nil?
      result['reasonReference'] = json_hash['reasonReference'].map { |var| Reference.transform_json(var) } unless json_hash['reasonReference'].nil?
      result['instantiatesCanonical'] = json_hash['instantiatesCanonical'].each_with_index.map do |var, i|
        extension_hash = json_hash['_instantiatesCanonical'] && json_hash['_instantiatesCanonical'][i]
        PrimitiveCanonical.transform_json(var, extension_hash)
      end unless json_hash['instantiatesCanonical'].nil?
      result['instantiatesUri'] = json_hash['instantiatesUri'].each_with_index.map do |var, i|
        extension_hash = json_hash['_instantiatesUri'] && json_hash['_instantiatesUri'][i]
        PrimitiveUri.transform_json(var, extension_hash)
      end unless json_hash['instantiatesUri'].nil?
      result['basedOn'] = json_hash['basedOn'].map { |var| Reference.transform_json(var) } unless json_hash['basedOn'].nil?
      result['groupIdentifier'] = Identifier.transform_json(json_hash['groupIdentifier']) unless json_hash['groupIdentifier'].nil?      
      result['courseOfTherapyType'] = CodeableConcept.transform_json(json_hash['courseOfTherapyType']) unless json_hash['courseOfTherapyType'].nil?      
      result['insurance'] = json_hash['insurance'].map { |var| Reference.transform_json(var) } unless json_hash['insurance'].nil?
      result['note'] = json_hash['note'].map { |var| Annotation.transform_json(var) } unless json_hash['note'].nil?
      result['dosageInstruction'] = json_hash['dosageInstruction'].map { |var| Dosage.transform_json(var) } unless json_hash['dosageInstruction'].nil?
      result['dispenseRequest'] = MedicationRequestDispenseRequest.transform_json(json_hash['dispenseRequest']) unless json_hash['dispenseRequest'].nil?      
      result['substitution'] = MedicationRequestSubstitution.transform_json(json_hash['substitution']) unless json_hash['substitution'].nil?      
      result['priorPrescription'] = Reference.transform_json(json_hash['priorPrescription']) unless json_hash['priorPrescription'].nil?      
      result['detectedIssue'] = json_hash['detectedIssue'].map { |var| Reference.transform_json(var) } unless json_hash['detectedIssue'].nil?
      result['eventHistory'] = json_hash['eventHistory'].map { |var| Reference.transform_json(var) } unless json_hash['eventHistory'].nil?

      result
    end
  end
end
