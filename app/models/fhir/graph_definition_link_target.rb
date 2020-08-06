module FHIR
  # fhir/graph_definition_link_target.rb
  class GraphDefinitionLinkTarget < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::ResourceType'    
    embeds_one :params, class_name: 'FHIR::PrimitiveString'    
    embeds_one :profile, class_name: 'FHIR::PrimitiveCanonical'    
    embeds_many :compartment, class_name: 'FHIR::GraphDefinitionLinkTargetCompartment'    
    embeds_many :link, class_name: 'FHIR::GraphDefinitionLink'    
    
    def as_json(*args)
      result = super      
      unless self.type.nil? 
        result['type'] = self.type.value
        serialized = Extension.serializePrimitiveExtension(self.type)            
        result['_type'] = serialized unless serialized.nil?
      end
      unless self.params.nil? 
        result['params'] = self.params.value
        serialized = Extension.serializePrimitiveExtension(self.params)            
        result['_params'] = serialized unless serialized.nil?
      end
      unless self.profile.nil? 
        result['profile'] = self.profile.value
        serialized = Extension.serializePrimitiveExtension(self.profile)            
        result['_profile'] = serialized unless serialized.nil?
      end
      unless self.compartment.nil?  || !self.compartment.any? 
        result['compartment'] = self.compartment.map{ |x| x.as_json(*args) }
      end
      unless self.link.nil?  || !self.link.any? 
        result['link'] = self.link.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = GraphDefinitionLinkTarget.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = ResourceType.transform_json(json_hash['type'], json_hash['_type']) unless json_hash['type'].nil?
      result['params'] = PrimitiveString.transform_json(json_hash['params'], json_hash['_params']) unless json_hash['params'].nil?
      result['profile'] = PrimitiveCanonical.transform_json(json_hash['profile'], json_hash['_profile']) unless json_hash['profile'].nil?
      result['compartment'] = json_hash['compartment'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          GraphDefinitionLinkTargetCompartment.transform_json(var) 
        end
      } unless json_hash['compartment'].nil?
      result['link'] = json_hash['link'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          GraphDefinitionLink.transform_json(var) 
        end
      } unless json_hash['link'].nil?

      result
    end
  end
end
