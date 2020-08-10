module FHIR
  # fhir/nutrition_order.rb
  class NutritionOrder < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_many :instantiatesCanonical, class_name: 'FHIR::PrimitiveCanonical'    
    embeds_many :instantiatesUri, class_name: 'FHIR::PrimitiveUri'    
    embeds_many :instantiates, class_name: 'FHIR::PrimitiveUri'    
    embeds_one :status, class_name: 'FHIR::NutritionOrderStatus'    
    embeds_one :intent, class_name: 'FHIR::NutritiionOrderIntent'    
    embeds_one :patient, class_name: 'FHIR::Reference'    
    embeds_one :encounter, class_name: 'FHIR::Reference'    
    embeds_one :dateTime, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :orderer, class_name: 'FHIR::Reference'    
    embeds_many :allergyIntolerance, class_name: 'FHIR::Reference'    
    embeds_many :foodPreferenceModifier, class_name: 'FHIR::CodeableConcept'    
    embeds_many :excludeFoodModifier, class_name: 'FHIR::CodeableConcept'    
    embeds_one :oralDiet, class_name: 'FHIR::NutritionOrderOralDiet'    
    embeds_many :supplement, class_name: 'FHIR::NutritionOrderSupplement'    
    embeds_one :enteralFormula, class_name: 'FHIR::NutritionOrderEnteralFormula'    
    embeds_many :note, class_name: 'FHIR::Annotation'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil?  || !self.identifier.any? 
        result['identifier'] = self.identifier.map{ |x| x.as_json(*args) }
      end
      unless self.instantiatesCanonical.nil?  || !self.instantiatesCanonical.any? 
        result['instantiatesCanonical'] = self.instantiatesCanonical.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.instantiatesCanonical)                              
        result['_instantiatesCanonical'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.instantiatesUri.nil?  || !self.instantiatesUri.any? 
        result['instantiatesUri'] = self.instantiatesUri.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.instantiatesUri)                              
        result['_instantiatesUri'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.instantiates.nil?  || !self.instantiates.any? 
        result['instantiates'] = self.instantiates.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.instantiates)                              
        result['_instantiates'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.status.nil? 
        result['status'] = self.status.value
        serialized = Extension.serializePrimitiveExtension(self.status)            
        result['_status'] = serialized unless serialized.nil?
      end
      unless self.intent.nil? 
        result['intent'] = self.intent.value
        serialized = Extension.serializePrimitiveExtension(self.intent)            
        result['_intent'] = serialized unless serialized.nil?
      end
      unless self.patient.nil? 
        result['patient'] = self.patient.as_json(*args)
      end
      unless self.encounter.nil? 
        result['encounter'] = self.encounter.as_json(*args)
      end
      unless self.dateTime.nil? 
        result['dateTime'] = self.dateTime.value
        serialized = Extension.serializePrimitiveExtension(self.dateTime)            
        result['_dateTime'] = serialized unless serialized.nil?
      end
      unless self.orderer.nil? 
        result['orderer'] = self.orderer.as_json(*args)
      end
      unless self.allergyIntolerance.nil?  || !self.allergyIntolerance.any? 
        result['allergyIntolerance'] = self.allergyIntolerance.map{ |x| x.as_json(*args) }
      end
      unless self.foodPreferenceModifier.nil?  || !self.foodPreferenceModifier.any? 
        result['foodPreferenceModifier'] = self.foodPreferenceModifier.map{ |x| x.as_json(*args) }
      end
      unless self.excludeFoodModifier.nil?  || !self.excludeFoodModifier.any? 
        result['excludeFoodModifier'] = self.excludeFoodModifier.map{ |x| x.as_json(*args) }
      end
      unless self.oralDiet.nil? 
        result['oralDiet'] = self.oralDiet.as_json(*args)
      end
      unless self.supplement.nil?  || !self.supplement.any? 
        result['supplement'] = self.supplement.map{ |x| x.as_json(*args) }
      end
      unless self.enteralFormula.nil? 
        result['enteralFormula'] = self.enteralFormula.as_json(*args)
      end
      unless self.note.nil?  || !self.note.any? 
        result['note'] = self.note.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = NutritionOrder.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['instantiatesCanonical'] = json_hash['instantiatesCanonical'].each_with_index.map do |var, i|
        extension_hash = json_hash['_instantiatesCanonical'] && json_hash['_instantiatesCanonical'][i]
        PrimitiveCanonical.transform_json(var, extension_hash)
      end unless json_hash['instantiatesCanonical'].nil?
      result['instantiatesUri'] = json_hash['instantiatesUri'].each_with_index.map do |var, i|
        extension_hash = json_hash['_instantiatesUri'] && json_hash['_instantiatesUri'][i]
        PrimitiveUri.transform_json(var, extension_hash)
      end unless json_hash['instantiatesUri'].nil?
      result['instantiates'] = json_hash['instantiates'].each_with_index.map do |var, i|
        extension_hash = json_hash['_instantiates'] && json_hash['_instantiates'][i]
        PrimitiveUri.transform_json(var, extension_hash)
      end unless json_hash['instantiates'].nil?
      result['status'] = NutritionOrderStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['intent'] = NutritiionOrderIntent.transform_json(json_hash['intent'], json_hash['_intent']) unless json_hash['intent'].nil?
      result['patient'] = Reference.transform_json(json_hash['patient']) unless json_hash['patient'].nil?
      result['encounter'] = Reference.transform_json(json_hash['encounter']) unless json_hash['encounter'].nil?
      result['dateTime'] = PrimitiveDateTime.transform_json(json_hash['dateTime'], json_hash['_dateTime']) unless json_hash['dateTime'].nil?
      result['orderer'] = Reference.transform_json(json_hash['orderer']) unless json_hash['orderer'].nil?
      result['allergyIntolerance'] = json_hash['allergyIntolerance'].map { |var| Reference.transform_json(var) } unless json_hash['allergyIntolerance'].nil?
      result['foodPreferenceModifier'] = json_hash['foodPreferenceModifier'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['foodPreferenceModifier'].nil?
      result['excludeFoodModifier'] = json_hash['excludeFoodModifier'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['excludeFoodModifier'].nil?
      result['oralDiet'] = NutritionOrderOralDiet.transform_json(json_hash['oralDiet']) unless json_hash['oralDiet'].nil?
      result['supplement'] = json_hash['supplement'].map { |var| NutritionOrderSupplement.transform_json(var) } unless json_hash['supplement'].nil?
      result['enteralFormula'] = NutritionOrderEnteralFormula.transform_json(json_hash['enteralFormula']) unless json_hash['enteralFormula'].nil?
      result['note'] = json_hash['note'].map { |var| Annotation.transform_json(var) } unless json_hash['note'].nil?

      result
    end
  end
end
