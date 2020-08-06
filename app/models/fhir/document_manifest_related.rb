module FHIR
  # fhir/document_manifest_related.rb
  class DocumentManifestRelated < BackboneElement
    include Mongoid::Document
    embeds_one :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :ref, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil? 
        result['identifier'] = self.identifier.as_json(*args)
      end
      unless self.ref.nil? 
        result['ref'] = self.ref.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = DocumentManifestRelated.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = Identifier.transform_json(json_hash['identifier']) unless json_hash['identifier'].nil?
      result['ref'] = Reference.transform_json(json_hash['ref']) unless json_hash['ref'].nil?

      result
    end
  end
end
