module FHIR
  # fhir/measure_group.rb
  class MeasureGroup < BackboneElement
    include Mongoid::Document
    embeds_one :code, class_name: 'FHIR::CodeableConcept'    
    embeds_one :description, class_name: 'FHIR::PrimitiveString'    
    embeds_many :population, class_name: 'FHIR::MeasureGroupPopulation'    
    embeds_many :stratifier, class_name: 'FHIR::MeasureGroupStratifier'    
    
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
      unless self.population.nil?  || !self.population.any? 
        result['population'] = self.population.map{ |x| x.as_json(*args) }
      end
      unless self.stratifier.nil?  || !self.stratifier.any? 
        result['stratifier'] = self.stratifier.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = MeasureGroup.new)
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['population'] = json_hash['population'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          MeasureGroupPopulation.transform_json(var) 
        end
      } unless json_hash['population'].nil?
      result['stratifier'] = json_hash['stratifier'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          MeasureGroupStratifier.transform_json(var) 
        end
      } unless json_hash['stratifier'].nil?

      result
    end
  end
end
