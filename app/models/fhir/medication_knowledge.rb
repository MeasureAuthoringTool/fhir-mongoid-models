module FHIR
  # fhir/medication_knowledge.rb
  class MedicationKnowledge < DomainResource
    include Mongoid::Document
    embeds_one :code, class_name: 'FHIR::CodeableConcept'    
    embeds_one :status, class_name: 'FHIR::MedicationKnowledgeStatus'    
    embeds_one :manufacturer, class_name: 'FHIR::Reference'    
    embeds_one :doseForm, class_name: 'FHIR::CodeableConcept'    
    embeds_one :amount, class_name: 'FHIR::SimpleQuantity'    
    embeds_many :synonym, class_name: 'FHIR::PrimitiveString'    
    embeds_many :relatedMedicationKnowledge, class_name: 'FHIR::MedicationKnowledgeRelatedMedicationKnowledge'    
    embeds_many :associatedMedication, class_name: 'FHIR::Reference'    
    embeds_many :productType, class_name: 'FHIR::CodeableConcept'    
    embeds_many :monograph, class_name: 'FHIR::MedicationKnowledgeMonograph'    
    embeds_many :ingredient, class_name: 'FHIR::MedicationKnowledgeIngredient'    
    embeds_one :preparationInstruction, class_name: 'FHIR::PrimitiveMarkdown'    
    embeds_many :intendedRoute, class_name: 'FHIR::CodeableConcept'    
    embeds_many :cost, class_name: 'FHIR::MedicationKnowledgeCost'    
    embeds_many :monitoringProgram, class_name: 'FHIR::MedicationKnowledgeMonitoringProgram'    
    embeds_many :administrationGuidelines, class_name: 'FHIR::MedicationKnowledgeAdministrationGuidelines'    
    embeds_many :medicineClassification, class_name: 'FHIR::MedicationKnowledgeMedicineClassification'    
    embeds_one :packaging, class_name: 'FHIR::MedicationKnowledgePackaging'    
    embeds_many :drugCharacteristic, class_name: 'FHIR::MedicationKnowledgeDrugCharacteristic'    
    embeds_many :contraindication, class_name: 'FHIR::Reference'    
    embeds_many :regulatory, class_name: 'FHIR::MedicationKnowledgeRegulatory'    
    embeds_many :kinetics, class_name: 'FHIR::MedicationKnowledgeKinetics'    
    
    def as_json(*args)
      result = super      
      unless self.code.nil? 
        result['code'] = self.code.as_json(*args)
      end
      unless self.status.nil? 
        result['status'] = self.status.value
        serialized = Extension.serializePrimitiveExtension(self.status)            
        result['_status'] = serialized unless serialized.nil?
      end
      unless self.manufacturer.nil? 
        result['manufacturer'] = self.manufacturer.as_json(*args)
      end
      unless self.doseForm.nil? 
        result['doseForm'] = self.doseForm.as_json(*args)
      end
      unless self.amount.nil? 
        result['amount'] = self.amount.as_json(*args)
      end
      unless self.synonym.nil?  || !self.synonym.any? 
        result['synonym'] = self.synonym.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.synonym)                              
        result['_synonym'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.relatedMedicationKnowledge.nil?  || !self.relatedMedicationKnowledge.any? 
        result['relatedMedicationKnowledge'] = self.relatedMedicationKnowledge.map{ |x| x.as_json(*args) }
      end
      unless self.associatedMedication.nil?  || !self.associatedMedication.any? 
        result['associatedMedication'] = self.associatedMedication.map{ |x| x.as_json(*args) }
      end
      unless self.productType.nil?  || !self.productType.any? 
        result['productType'] = self.productType.map{ |x| x.as_json(*args) }
      end
      unless self.monograph.nil?  || !self.monograph.any? 
        result['monograph'] = self.monograph.map{ |x| x.as_json(*args) }
      end
      unless self.ingredient.nil?  || !self.ingredient.any? 
        result['ingredient'] = self.ingredient.map{ |x| x.as_json(*args) }
      end
      unless self.preparationInstruction.nil? 
        result['preparationInstruction'] = self.preparationInstruction.value
        serialized = Extension.serializePrimitiveExtension(self.preparationInstruction)            
        result['_preparationInstruction'] = serialized unless serialized.nil?
      end
      unless self.intendedRoute.nil?  || !self.intendedRoute.any? 
        result['intendedRoute'] = self.intendedRoute.map{ |x| x.as_json(*args) }
      end
      unless self.cost.nil?  || !self.cost.any? 
        result['cost'] = self.cost.map{ |x| x.as_json(*args) }
      end
      unless self.monitoringProgram.nil?  || !self.monitoringProgram.any? 
        result['monitoringProgram'] = self.monitoringProgram.map{ |x| x.as_json(*args) }
      end
      unless self.administrationGuidelines.nil?  || !self.administrationGuidelines.any? 
        result['administrationGuidelines'] = self.administrationGuidelines.map{ |x| x.as_json(*args) }
      end
      unless self.medicineClassification.nil?  || !self.medicineClassification.any? 
        result['medicineClassification'] = self.medicineClassification.map{ |x| x.as_json(*args) }
      end
      unless self.packaging.nil? 
        result['packaging'] = self.packaging.as_json(*args)
      end
      unless self.drugCharacteristic.nil?  || !self.drugCharacteristic.any? 
        result['drugCharacteristic'] = self.drugCharacteristic.map{ |x| x.as_json(*args) }
      end
      unless self.contraindication.nil?  || !self.contraindication.any? 
        result['contraindication'] = self.contraindication.map{ |x| x.as_json(*args) }
      end
      unless self.regulatory.nil?  || !self.regulatory.any? 
        result['regulatory'] = self.regulatory.map{ |x| x.as_json(*args) }
      end
      unless self.kinetics.nil?  || !self.kinetics.any? 
        result['kinetics'] = self.kinetics.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = MedicationKnowledge.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?
      result['status'] = MedicationKnowledgeStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
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
