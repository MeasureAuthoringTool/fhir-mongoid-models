module FHIR
  class CatalogEntryRelatedEntry < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'CatalogEntryRelatedEntry'
    embeds_one :relationtype, class_name: 'CatalogEntryRelationType'
    embeds_one :item, class_name: 'Reference'
  end
end
