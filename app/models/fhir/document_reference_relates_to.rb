module FHIR
  # fhir/document_reference_relates_to.rb
  class DocumentReferenceRelatesTo < BackboneElement
    include Mongoid::Document
    embeds_one :code, class_name: 'FHIR::DocumentRelationshipType'    
    embeds_one :target, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.code.nil? 
        result['code'] = self.code.value
        serialized = Extension.serializePrimitiveExtension(self.code)            
        result['_code'] = serialized unless serialized.nil?
      end
      unless self.target.nil? 
        result['target'] = self.target.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = DocumentReferenceRelatesTo.new)
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = DocumentRelationshipType.transform_json(json_hash['code'], json_hash['_code']) unless json_hash['code'].nil?
      result['target'] = Reference.transform_json(json_hash['target']) unless json_hash['target'].nil?

      result
    end
  end
end
