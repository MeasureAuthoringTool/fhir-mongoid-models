module FHIR
  class BundleEntryResponse < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'BundleEntryResponse'
    field :status, type:  # primitive
    embeds_one :_status, class_name: 'Extension'
    field :location, type:  # primitive
    embeds_one :_location, class_name: 'Extension'
    field :etag, type:  # primitive
    embeds_one :_etag, class_name: 'Extension'
    field :lastModified, type:  # primitive
    embeds_one :_lastModified, class_name: 'Extension'
    embeds_one :outcome, class_name: 'Resource'
  end
end
