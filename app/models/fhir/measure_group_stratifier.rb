module FHIR
  # fhir/measure_group_stratifier.rb
  class MeasureGroupStratifier < BackboneElement
    include Mongoid::Document
    embeds_one :code, class_name: 'FHIR::CodeableConcept'    
    embeds_one :description, class_name: 'FHIR::PrimitiveString'    
    embeds_one :criteria, class_name: 'FHIR::Expression'    
    embeds_many :component, class_name: 'FHIR::MeasureGroupStratifierComponent'    
    
    def as_json(*args)
      result = super      
      unless self.code.nil? 
        result['code'] = self.code.as_json(*args)
      end
      unless self.description.nil? 
        result['description'] = self.description.value
        serialized = Extension.serializePrimitiveExtension(self.description)            
        result['_description'] = serialized unless serialized.nil?
      end
      unless self.criteria.nil? 
        result['criteria'] = self.criteria.as_json(*args)
      end
      unless self.component.nil?  || !self.component.any? 
        result['component'] = self.component.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = MeasureGroupStratifier.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['criteria'] = Expression.transform_json(json_hash['criteria']) unless json_hash['criteria'].nil?
      result['component'] = json_hash['component'].map { |var| MeasureGroupStratifierComponent.transform_json(var) } unless json_hash['component'].nil?

      result
    end
  end
end
