module FHIR
  # fhir/test_script_metadata_capability.rb
  class TestScriptMetadataCapability < BackboneElement
    include Mongoid::Document
    embeds_one :required, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :validated_local, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :description, class_name: 'FHIR::PrimitiveString'    
    embeds_many :origin, class_name: 'FHIR::PrimitiveInteger'    
    embeds_one :destination, class_name: 'FHIR::PrimitiveInteger'    
    embeds_many :link, class_name: 'FHIR::PrimitiveUri'    
    embeds_one :capabilities, class_name: 'FHIR::PrimitiveCanonical'    
    
    def as_json(*args)
      result = super      
      unless self.required.nil? 
        result['required'] = self.required.value
        serialized = Extension.serializePrimitiveExtension(self.required)            
        result['_required'] = serialized unless serialized.nil?
      end
      unless self.validated_local.nil? 
        result['validated'] = self.validated_local.value
        serialized = Extension.serializePrimitiveExtension(self.validated_local)            
        result['_validated'] = serialized unless serialized.nil?
      end
      unless self.description.nil? 
        result['description'] = self.description.value
        serialized = Extension.serializePrimitiveExtension(self.description)            
        result['_description'] = serialized unless serialized.nil?
      end
      unless self.origin.nil?  || !self.origin.any? 
        result['origin'] = self.origin.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.origin)                              
        result['_origin'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.destination.nil? 
        result['destination'] = self.destination.value
        serialized = Extension.serializePrimitiveExtension(self.destination)            
        result['_destination'] = serialized unless serialized.nil?
      end
      unless self.link.nil?  || !self.link.any? 
        result['link'] = self.link.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.link)                              
        result['_link'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.capabilities.nil? 
        result['capabilities'] = self.capabilities.value
        serialized = Extension.serializePrimitiveExtension(self.capabilities)            
        result['_capabilities'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = TestScriptMetadataCapability.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['required'] = PrimitiveBoolean.transform_json(json_hash['required'], json_hash['_required']) unless json_hash['required'].nil?
      result['validated_local'] = PrimitiveBoolean.transform_json(json_hash['validated'], json_hash['_validated']) unless json_hash['validated'].nil?
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['origin'] = json_hash['origin'].each_with_index.map do |var, i|
        extension_hash = json_hash['_origin'] && json_hash['_origin'][i]
        PrimitiveInteger.transform_json(var, extension_hash)
      end unless json_hash['origin'].nil?
      result['destination'] = PrimitiveInteger.transform_json(json_hash['destination'], json_hash['_destination']) unless json_hash['destination'].nil?
      result['link'] = json_hash['link'].each_with_index.map do |var, i|
        extension_hash = json_hash['_link'] && json_hash['_link'][i]
        PrimitiveUri.transform_json(var, extension_hash)
      end unless json_hash['link'].nil?
      result['capabilities'] = PrimitiveCanonical.transform_json(json_hash['capabilities'], json_hash['_capabilities']) unless json_hash['capabilities'].nil?

      result
    end
  end
end
