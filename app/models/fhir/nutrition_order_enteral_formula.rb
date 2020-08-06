module FHIR
  # fhir/nutrition_order_enteral_formula.rb
  class NutritionOrderEnteralFormula < BackboneElement
    include Mongoid::Document
    embeds_one :baseFormulaType, class_name: 'FHIR::CodeableConcept'    
    embeds_one :baseFormulaProductName, class_name: 'FHIR::PrimitiveString'    
    embeds_one :additiveType, class_name: 'FHIR::CodeableConcept'    
    embeds_one :additiveProductName, class_name: 'FHIR::PrimitiveString'    
    embeds_one :caloricDensity, class_name: 'FHIR::SimpleQuantity'    
    embeds_one :routeofAdministration, class_name: 'FHIR::CodeableConcept'    
    embeds_many :administration, class_name: 'FHIR::NutritionOrderEnteralFormulaAdministration'    
    embeds_one :maxVolumeToDeliver, class_name: 'FHIR::SimpleQuantity'    
    embeds_one :administrationInstruction, class_name: 'FHIR::PrimitiveString'    
    
    def as_json(*args)
      result = super      
      unless self.baseFormulaType.nil? 
        result['baseFormulaType'] = self.baseFormulaType.as_json(*args)
      end
      unless self.baseFormulaProductName.nil? 
        result['baseFormulaProductName'] = self.baseFormulaProductName.value
        serialized = Extension.serializePrimitiveExtension(self.baseFormulaProductName)            
        result['_baseFormulaProductName'] = serialized unless serialized.nil?
      end
      unless self.additiveType.nil? 
        result['additiveType'] = self.additiveType.as_json(*args)
      end
      unless self.additiveProductName.nil? 
        result['additiveProductName'] = self.additiveProductName.value
        serialized = Extension.serializePrimitiveExtension(self.additiveProductName)            
        result['_additiveProductName'] = serialized unless serialized.nil?
      end
      unless self.caloricDensity.nil? 
        result['caloricDensity'] = self.caloricDensity.as_json(*args)
      end
      unless self.routeofAdministration.nil? 
        result['routeofAdministration'] = self.routeofAdministration.as_json(*args)
      end
      unless self.administration.nil?  || !self.administration.any? 
        result['administration'] = self.administration.map{ |x| x.as_json(*args) }
      end
      unless self.maxVolumeToDeliver.nil? 
        result['maxVolumeToDeliver'] = self.maxVolumeToDeliver.as_json(*args)
      end
      unless self.administrationInstruction.nil? 
        result['administrationInstruction'] = self.administrationInstruction.value
        serialized = Extension.serializePrimitiveExtension(self.administrationInstruction)            
        result['_administrationInstruction'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = NutritionOrderEnteralFormula.new)
      result = self.superclass.transform_json(json_hash, target)
      result['baseFormulaType'] = CodeableConcept.transform_json(json_hash['baseFormulaType']) unless json_hash['baseFormulaType'].nil?
      result['baseFormulaProductName'] = PrimitiveString.transform_json(json_hash['baseFormulaProductName'], json_hash['_baseFormulaProductName']) unless json_hash['baseFormulaProductName'].nil?
      result['additiveType'] = CodeableConcept.transform_json(json_hash['additiveType']) unless json_hash['additiveType'].nil?
      result['additiveProductName'] = PrimitiveString.transform_json(json_hash['additiveProductName'], json_hash['_additiveProductName']) unless json_hash['additiveProductName'].nil?
      result['caloricDensity'] = SimpleQuantity.transform_json(json_hash['caloricDensity']) unless json_hash['caloricDensity'].nil?
      result['routeofAdministration'] = CodeableConcept.transform_json(json_hash['routeofAdministration']) unless json_hash['routeofAdministration'].nil?
      result['administration'] = json_hash['administration'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          NutritionOrderEnteralFormulaAdministration.transform_json(var) 
        end
      } unless json_hash['administration'].nil?
      result['maxVolumeToDeliver'] = SimpleQuantity.transform_json(json_hash['maxVolumeToDeliver']) unless json_hash['maxVolumeToDeliver'].nil?
      result['administrationInstruction'] = PrimitiveString.transform_json(json_hash['administrationInstruction'], json_hash['_administrationInstruction']) unless json_hash['administrationInstruction'].nil?

      result
    end
  end
end
