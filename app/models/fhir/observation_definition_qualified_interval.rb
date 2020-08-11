module FHIR
  # fhir/observation_definition_qualified_interval.rb
  class ObservationDefinitionQualifiedInterval < BackboneElement
    include Mongoid::Document
    embeds_one :category, class_name: 'FHIR::ObservationRangeCategory'    
    embeds_one :range, class_name: 'FHIR::Range'    
    embeds_one :context, class_name: 'FHIR::CodeableConcept'    
    embeds_many :appliesTo, class_name: 'FHIR::CodeableConcept'    
    embeds_one :gender, class_name: 'FHIR::AdministrativeGender'    
    embeds_one :age, class_name: 'FHIR::Range'    
    embeds_one :gestationalAge, class_name: 'FHIR::Range'    
    embeds_one :condition, class_name: 'FHIR::PrimitiveString'    
    
    def as_json(*args)
      result = super      
      unless self.category.nil? 
        result['category'] = self.category.value
        serialized = Extension.serializePrimitiveExtension(self.category)            
        result['_category'] = serialized unless serialized.nil?
      end
      unless self.range.nil? 
        result['range'] = self.range.as_json(*args)
      end
      unless self.context.nil? 
        result['context'] = self.context.as_json(*args)
      end
      unless self.appliesTo.nil?  || !self.appliesTo.any? 
        result['appliesTo'] = self.appliesTo.map{ |x| x.as_json(*args) }
      end
      unless self.gender.nil? 
        result['gender'] = self.gender.value
        serialized = Extension.serializePrimitiveExtension(self.gender)            
        result['_gender'] = serialized unless serialized.nil?
      end
      unless self.age.nil? 
        result['age'] = self.age.as_json(*args)
      end
      unless self.gestationalAge.nil? 
        result['gestationalAge'] = self.gestationalAge.as_json(*args)
      end
      unless self.condition.nil? 
        result['condition'] = self.condition.value
        serialized = Extension.serializePrimitiveExtension(self.condition)            
        result['_condition'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ObservationDefinitionQualifiedInterval.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['category'] = ObservationRangeCategory.transform_json(json_hash['category'], json_hash['_category']) unless json_hash['category'].nil?
      result['range'] = Range.transform_json(json_hash['range']) unless json_hash['range'].nil?
      result['context'] = CodeableConcept.transform_json(json_hash['context']) unless json_hash['context'].nil?
      result['appliesTo'] = json_hash['appliesTo'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['appliesTo'].nil?
      result['gender'] = AdministrativeGender.transform_json(json_hash['gender'], json_hash['_gender']) unless json_hash['gender'].nil?
      result['age'] = Range.transform_json(json_hash['age']) unless json_hash['age'].nil?
      result['gestationalAge'] = Range.transform_json(json_hash['gestationalAge']) unless json_hash['gestationalAge'].nil?
      result['condition'] = PrimitiveString.transform_json(json_hash['condition'], json_hash['_condition']) unless json_hash['condition'].nil?

      result
    end
  end
end
