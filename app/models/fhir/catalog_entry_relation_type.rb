module FHIR
  # fhir/catalog_entry_relation_type.rb
  class CatalogEntryRelationType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'CatalogEntryRelationType'
    field :value, type: String

    def self.transform_json(json_hash)
      result = CatalogEntryRelationType.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
