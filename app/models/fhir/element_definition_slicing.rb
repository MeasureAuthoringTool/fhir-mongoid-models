module FHIR
  # fhir/element_definition_slicing.rb
  class ElementDefinitionSlicing < Element
    include Mongoid::Document
    embeds_many :discriminator, class_name: 'FHIR::ElementDefinitionSlicingDiscriminator'    
    embeds_one :description, class_name: 'FHIR::PrimitiveString'    
    embeds_one :ordered, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :rules, class_name: 'FHIR::SlicingRules'    
    
    def as_json(*args)
      result = super      
      unless self.discriminator.nil?  || !self.discriminator.any? 
        result['discriminator'] = self.discriminator.map{ |x| x.as_json(*args) }
      end
      unless self.description.nil? 
        result['description'] = self.description.value
        serialized = Extension.serializePrimitiveExtension(self.description)            
        result['_description'] = serialized unless serialized.nil?
      end
      unless self.ordered.nil? 
        result['ordered'] = self.ordered.value
        serialized = Extension.serializePrimitiveExtension(self.ordered)            
        result['_ordered'] = serialized unless serialized.nil?
      end
      unless self.rules.nil? 
        result['rules'] = self.rules.value
        serialized = Extension.serializePrimitiveExtension(self.rules)            
        result['_rules'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ElementDefinitionSlicing.new)
      result = self.superclass.transform_json(json_hash, target)
      result['discriminator'] = json_hash['discriminator'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          ElementDefinitionSlicingDiscriminator.transform_json(var) 
        end
      } unless json_hash['discriminator'].nil?
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['ordered'] = PrimitiveBoolean.transform_json(json_hash['ordered'], json_hash['_ordered']) unless json_hash['ordered'].nil?
      result['rules'] = SlicingRules.transform_json(json_hash['rules'], json_hash['_rules']) unless json_hash['rules'].nil?

      result
    end
  end
end
