module FHIR
  class CatalogEntryRelationType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'CatalogEntryRelationType'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
