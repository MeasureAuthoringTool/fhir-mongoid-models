module FHIR
  # fhir/medication_knowledge.rb
  class MedicationKnowledge < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationKnowledge'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_one :status, class_name: 'MedicationKnowledgeStatus'
    embeds_one :manufacturer, class_name: 'Reference'
    embeds_one :doseForm, class_name: 'CodeableConcept'
    embeds_one :amount, class_name: 'SimpleQuantity'
    embeds_many :synonym, class_name: 'PrimitiveString'
    embeds_many :relatedMedicationKnowledge, class_name: 'MedicationKnowledgeRelatedMedicationKnowledge'
    embeds_many :associatedMedication, class_name: 'Reference'
    embeds_many :productType, class_name: 'CodeableConcept'
    embeds_many :monograph, class_name: 'MedicationKnowledgeMonograph'
    embeds_many :ingredient, class_name: 'MedicationKnowledgeIngredient'
    embeds_one :preparationInstruction, class_name: 'PrimitiveMarkdown'
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

    def self.transform_json(json_hash, target=MedicationKnowledge.new)
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?      
      result['status'] = MedicationKnowledgeStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['manufacturer'] = Reference.transform_json(json_hash['manufacturer']) unless json_hash['manufacturer'].nil?      
      result['doseForm'] = CodeableConcept.transform_json(json_hash['doseForm']) unless json_hash['doseForm'].nil?      
      result['amount'] = SimpleQuantity.transform_json(json_hash['amount']) unless json_hash['amount'].nil?      
      result['synonym'] = json_hash['synonym'].each_with_index.map do |var, i|
        extension_hash = json_hash['_synonym'] && json_hash['_synonym'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['synonym'].nil?
      result['relatedMedicationKnowledge'] = json_hash['relatedMedicationKnowledge'].map { |var| MedicationKnowledgeRelatedMedicationKnowledge.transform_json(var) } unless json_hash['relatedMedicationKnowledge'].nil?
      result['associatedMedication'] = json_hash['associatedMedication'].map { |var| Reference.transform_json(var) } unless json_hash['associatedMedication'].nil?
      result['productType'] = json_hash['productType'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['productType'].nil?
      result['monograph'] = json_hash['monograph'].map { |var| MedicationKnowledgeMonograph.transform_json(var) } unless json_hash['monograph'].nil?
      result['ingredient'] = json_hash['ingredient'].map { |var| MedicationKnowledgeIngredient.transform_json(var) } unless json_hash['ingredient'].nil?
      result['preparationInstruction'] = PrimitiveMarkdown.transform_json(json_hash['preparationInstruction'], json_hash['_preparationInstruction']) unless json_hash['preparationInstruction'].nil?      
      result['intendedRoute'] = json_hash['intendedRoute'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['intendedRoute'].nil?
      result['cost'] = json_hash['cost'].map { |var| MedicationKnowledgeCost.transform_json(var) } unless json_hash['cost'].nil?
      result['monitoringProgram'] = json_hash['monitoringProgram'].map { |var| MedicationKnowledgeMonitoringProgram.transform_json(var) } unless json_hash['monitoringProgram'].nil?
      result['administrationGuidelines'] = json_hash['administrationGuidelines'].map { |var| MedicationKnowledgeAdministrationGuidelines.transform_json(var) } unless json_hash['administrationGuidelines'].nil?
      result['medicineClassification'] = json_hash['medicineClassification'].map { |var| MedicationKnowledgeMedicineClassification.transform_json(var) } unless json_hash['medicineClassification'].nil?
      result['packaging'] = MedicationKnowledgePackaging.transform_json(json_hash['packaging']) unless json_hash['packaging'].nil?      
      result['drugCharacteristic'] = json_hash['drugCharacteristic'].map { |var| MedicationKnowledgeDrugCharacteristic.transform_json(var) } unless json_hash['drugCharacteristic'].nil?
      result['contraindication'] = json_hash['contraindication'].map { |var| Reference.transform_json(var) } unless json_hash['contraindication'].nil?
      result['regulatory'] = json_hash['regulatory'].map { |var| MedicationKnowledgeRegulatory.transform_json(var) } unless json_hash['regulatory'].nil?
      result['kinetics'] = json_hash['kinetics'].map { |var| MedicationKnowledgeKinetics.transform_json(var) } unless json_hash['kinetics'].nil?

      result
    end
  end
end
