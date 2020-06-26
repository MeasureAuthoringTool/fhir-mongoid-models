module FHIR
  # fhir/catalog_entry_related_entry.rb
  class CatalogEntryRelatedEntry < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'CatalogEntryRelatedEntry'
    embeds_one :relationtype, class_name: 'CatalogEntryRelationType'
    embeds_one :item, class_name: 'Reference'

    def self.transform_json(json_hash)
      result = CatalogEntryRelatedEntry.new
      result['relationtype'] = CatalogEntryRelationType.transform_json(json_hash['relationtype']) unless json_hash['relationtype'].nil?      
      result['item'] = Reference.transform_json(json_hash['item']) unless json_hash['item'].nil?      

      result
    end
  end
end
