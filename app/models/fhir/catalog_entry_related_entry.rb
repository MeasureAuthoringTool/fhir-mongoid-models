module FHIR
  # fhir/catalog_entry_related_entry.rb
  class CatalogEntryRelatedEntry < BackboneElement
    include Mongoid::Document
    embeds_one :relationtype, class_name: 'FHIR::CatalogEntryRelationType'    
    embeds_one :item, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.relationtype.nil? 
        result['relationtype'] = self.relationtype.value
        serialized = Extension.serializePrimitiveExtension(self.relationtype)            
        result['_relationtype'] = serialized unless serialized.nil?
      end
      unless self.item.nil? 
        result['item'] = self.item.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = CatalogEntryRelatedEntry.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['relationtype'] = CatalogEntryRelationType.transform_json(json_hash['relationtype'], json_hash['_relationtype']) unless json_hash['relationtype'].nil?
      result['item'] = Reference.transform_json(json_hash['item']) unless json_hash['item'].nil?

      result
    end
  end
end
