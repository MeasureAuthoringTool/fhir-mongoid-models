module FHIR
  # fhir/structure_definition_differential.rb
  class StructureDefinitionDifferential < BackboneElement
    include Mongoid::Document
    embeds_many :element, class_name: 'FHIR::ElementDefinition'    
    
    def as_json(*args)
      result = super      
      unless self.element.nil?  || !self.element.any? 
        result['element'] = self.element.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = StructureDefinitionDifferential.new)
      result = self.superclass.transform_json(json_hash, target)
      result['element'] = json_hash['element'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          ElementDefinition.transform_json(var) 
        end
      } unless json_hash['element'].nil?

      result
    end
  end
end
