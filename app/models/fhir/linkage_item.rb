module FHIR
  # fhir/linkage_item.rb
  class LinkageItem < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::LinkageType'    
    embeds_one :resource, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.type.nil? 
        result['type'] = self.type.value
        serialized = Extension.serializePrimitiveExtension(self.type)            
        result['_type'] = serialized unless serialized.nil?
      end
      unless self.resource.nil? 
        result['resource'] = self.resource.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = LinkageItem.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = LinkageType.transform_json(json_hash['type'], json_hash['_type']) unless json_hash['type'].nil?
      result['resource'] = Reference.transform_json(json_hash['resource']) unless json_hash['resource'].nil?

      result
    end
  end
end
