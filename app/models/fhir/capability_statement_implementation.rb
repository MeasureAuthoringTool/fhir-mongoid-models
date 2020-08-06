module FHIR
  # fhir/capability_statement_implementation.rb
  class CapabilityStatementImplementation < BackboneElement
    include Mongoid::Document
    embeds_one :description, class_name: 'FHIR::PrimitiveString'    
    embeds_one :url, class_name: 'FHIR::PrimitiveUrl'    
    embeds_one :custodian, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.description.nil? 
        result['description'] = self.description.value
        serialized = Extension.serializePrimitiveExtension(self.description)            
        result['_description'] = serialized unless serialized.nil?
      end
      unless self.url.nil? 
        result['url'] = self.url.value
        serialized = Extension.serializePrimitiveExtension(self.url)            
        result['_url'] = serialized unless serialized.nil?
      end
      unless self.custodian.nil? 
        result['custodian'] = self.custodian.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = CapabilityStatementImplementation.new)
      result = self.superclass.transform_json(json_hash, target)
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['url'] = PrimitiveUrl.transform_json(json_hash['url'], json_hash['_url']) unless json_hash['url'].nil?
      result['custodian'] = Reference.transform_json(json_hash['custodian']) unless json_hash['custodian'].nil?

      result
    end
  end
end
