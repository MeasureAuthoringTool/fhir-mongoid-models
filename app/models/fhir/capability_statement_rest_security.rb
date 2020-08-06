module FHIR
  # fhir/capability_statement_rest_security.rb
  class CapabilityStatementRestSecurity < BackboneElement
    include Mongoid::Document
    embeds_one :cors, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_many :service, class_name: 'FHIR::CodeableConcept'    
    embeds_one :description, class_name: 'FHIR::PrimitiveMarkdown'    
    
    def as_json(*args)
      result = super      
      unless self.cors.nil? 
        result['cors'] = self.cors.value
        serialized = Extension.serializePrimitiveExtension(self.cors)            
        result['_cors'] = serialized unless serialized.nil?
      end
      unless self.service.nil?  || !self.service.any? 
        result['service'] = self.service.map{ |x| x.as_json(*args) }
      end
      unless self.description.nil? 
        result['description'] = self.description.value
        serialized = Extension.serializePrimitiveExtension(self.description)            
        result['_description'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = CapabilityStatementRestSecurity.new)
      result = self.superclass.transform_json(json_hash, target)
      result['cors'] = PrimitiveBoolean.transform_json(json_hash['cors'], json_hash['_cors']) unless json_hash['cors'].nil?
      result['service'] = json_hash['service'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['service'].nil?
      result['description'] = PrimitiveMarkdown.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?

      result
    end
  end
end
