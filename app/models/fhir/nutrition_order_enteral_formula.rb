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

    def self.transform_json(json_hash, target = NutritionOrderEnteralFormula.new)
      result = self.superclass.transform_json(json_hash, target)
      result['baseFormulaType'] = CodeableConcept.transform_json(json_hash['baseFormulaType']) unless json_hash['baseFormulaType'].nil?
      result['baseFormulaProductName'] = PrimitiveString.transform_json(json_hash['baseFormulaProductName'], json_hash['_baseFormulaProductName']) unless json_hash['baseFormulaProductName'].nil?
      result['additiveType'] = CodeableConcept.transform_json(json_hash['additiveType']) unless json_hash['additiveType'].nil?
      result['additiveProductName'] = PrimitiveString.transform_json(json_hash['additiveProductName'], json_hash['_additiveProductName']) unless json_hash['additiveProductName'].nil?
      result['caloricDensity'] = SimpleQuantity.transform_json(json_hash['caloricDensity']) unless json_hash['caloricDensity'].nil?
      result['routeofAdministration'] = CodeableConcept.transform_json(json_hash['routeofAdministration']) unless json_hash['routeofAdministration'].nil?
      result['administration'] = json_hash['administration'].map { |var| NutritionOrderEnteralFormulaAdministration.transform_json(var) } unless json_hash['administration'].nil?
      result['maxVolumeToDeliver'] = SimpleQuantity.transform_json(json_hash['maxVolumeToDeliver']) unless json_hash['maxVolumeToDeliver'].nil?
      result['administrationInstruction'] = PrimitiveString.transform_json(json_hash['administrationInstruction'], json_hash['_administrationInstruction']) unless json_hash['administrationInstruction'].nil?

      result
    end
  end
end
