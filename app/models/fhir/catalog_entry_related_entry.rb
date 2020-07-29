module FHIR
  # fhir/catalog_entry_related_entry.rb
  class CatalogEntryRelatedEntry < BackboneElement
    include Mongoid::Document
    embeds_one :relationtype, class_name: 'FHIR::CatalogEntryRelationType'    
    embeds_one :item, class_name: 'FHIR::Reference'    

    def self.transform_json(json_hash, target = CatalogEntryRelatedEntry.new)
      result = self.superclass.transform_json(json_hash, target)
      result['relationtype'] = CatalogEntryRelationType.transform_json(json_hash['relationtype']) unless json_hash['relationtype'].nil?
      result['item'] = Reference.transform_json(json_hash['item']) unless json_hash['item'].nil?

      result
    end
  end
end
