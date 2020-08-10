module FHIR
  # fhir/capability_statement_rest.rb
  class CapabilityStatementRest < BackboneElement
    include Mongoid::Document
    embeds_one :mode, class_name: 'FHIR::RestfulCapabilityMode'    
    embeds_one :documentation, class_name: 'FHIR::PrimitiveMarkdown'    
    embeds_one :security, class_name: 'FHIR::CapabilityStatementRestSecurity'    
    embeds_many :resource, class_name: 'FHIR::CapabilityStatementRestResource'    
    embeds_many :interaction, class_name: 'FHIR::CapabilityStatementRestInteraction'    
    embeds_many :searchParam, class_name: 'FHIR::CapabilityStatementRestResourceSearchParam'    
    embeds_many :operation, class_name: 'FHIR::CapabilityStatementRestResourceOperation'    
    embeds_many :compartment, class_name: 'FHIR::PrimitiveCanonical'    
    
    def as_json(*args)
      result = super      
      unless self.mode.nil? 
        result['mode'] = self.mode.value
        serialized = Extension.serializePrimitiveExtension(self.mode)            
        result['_mode'] = serialized unless serialized.nil?
      end
      unless self.documentation.nil? 
        result['documentation'] = self.documentation.value
        serialized = Extension.serializePrimitiveExtension(self.documentation)            
        result['_documentation'] = serialized unless serialized.nil?
      end
      unless self.security.nil? 
        result['security'] = self.security.as_json(*args)
      end
      unless self.resource.nil?  || !self.resource.any? 
        result['resource'] = self.resource.map{ |x| x.as_json(*args) }
      end
      unless self.interaction.nil?  || !self.interaction.any? 
        result['interaction'] = self.interaction.map{ |x| x.as_json(*args) }
      end
      unless self.searchParam.nil?  || !self.searchParam.any? 
        result['searchParam'] = self.searchParam.map{ |x| x.as_json(*args) }
      end
      unless self.operation.nil?  || !self.operation.any? 
        result['operation'] = self.operation.map{ |x| x.as_json(*args) }
      end
      unless self.compartment.nil?  || !self.compartment.any? 
        result['compartment'] = self.compartment.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.compartment)                              
        result['_compartment'] = serialized unless serialized.nil? || !serialized.any?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = CapabilityStatementRest.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['mode'] = RestfulCapabilityMode.transform_json(json_hash['mode'], json_hash['_mode']) unless json_hash['mode'].nil?
      result['documentation'] = PrimitiveMarkdown.transform_json(json_hash['documentation'], json_hash['_documentation']) unless json_hash['documentation'].nil?
      result['security'] = CapabilityStatementRestSecurity.transform_json(json_hash['security']) unless json_hash['security'].nil?
      result['resource'] = json_hash['resource'].map { |var| CapabilityStatementRestResource.transform_json(var) } unless json_hash['resource'].nil?
      result['interaction'] = json_hash['interaction'].map { |var| CapabilityStatementRestInteraction.transform_json(var) } unless json_hash['interaction'].nil?
      result['searchParam'] = json_hash['searchParam'].map { |var| CapabilityStatementRestResourceSearchParam.transform_json(var) } unless json_hash['searchParam'].nil?
      result['operation'] = json_hash['operation'].map { |var| CapabilityStatementRestResourceOperation.transform_json(var) } unless json_hash['operation'].nil?
      result['compartment'] = json_hash['compartment'].each_with_index.map do |var, i|
        extension_hash = json_hash['_compartment'] && json_hash['_compartment'][i]
        PrimitiveCanonical.transform_json(var, extension_hash)
      end unless json_hash['compartment'].nil?

      result
    end
  end
end
