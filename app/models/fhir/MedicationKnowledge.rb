module FHIR
  class MedicationKnowledge < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationKnowledge'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_one :status, class_name: 'MedicationKnowledgeStatus'
    embeds_one :manufacturer, class_name: 'Reference'
    embeds_one :doseForm, class_name: 'CodeableConcept'
    embeds_one :amount, class_name: 'SimpleQuantity'
    field :synonym, type: Array # primitive
    embeds_many :_synonym, class_name: 'Extension'
    embeds_many :relatedMedicationKnowledge, class_name: 'MedicationKnowledgeRelatedMedicationKnowledge'
    embeds_many :associatedMedication, class_name: 'Reference'
    embeds_many :productType, class_name: 'CodeableConcept'
    embeds_many :monograph, class_name: 'MedicationKnowledgeMonograph'
    embeds_many :ingredient, class_name: 'MedicationKnowledgeIngredient'
    field :preparationInstruction, type:  # primitive
    embeds_one :_preparationInstruction, class_name: 'Extension'
    embeds_many :intendedRoute, class_name: 'CodeableConcept'
    embeds_many :cost, class_name: 'MedicationKnowledgeCost'
    embeds_many :monitoringProgram, class_name: 'MedicationKnowledgeMonitoringProgram'
    embeds_many :administrationGuidelines, class_name: 'MedicationKnowledgeAdministrationGuidelines'
    embeds_many :medicineClassification, class_name: 'MedicationKnowledgeMedicineClassification'
    embeds_one :packaging, class_name: 'MedicationKnowledgePackaging'
    embeds_many :drugCharacteristic, class_name: 'MedicationKnowledgeDrugCharacteristic'
    embeds_many :contraindication, class_name: 'Reference'
    embeds_many :regulatory, class_name: 'MedicationKnowledgeRegulatory'
    embeds_many :kinetics, class_name: 'MedicationKnowledgeKinetics'
  end
end
