module FHIR
  class BundleEntryRequest < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'BundleEntryRequest'
    embeds_one :method, class_name: 'HTTPVerb'
    field :url, type:  # primitive
    embeds_one :_url, class_name: 'Extension'
    field :ifNoneMatch, type:  # primitive
    embeds_one :_ifNoneMatch, class_name: 'Extension'
    field :ifModifiedSince, type:  # primitive
    embeds_one :_ifModifiedSince, class_name: 'Extension'
    field :ifMatch, type:  # primitive
    embeds_one :_ifMatch, class_name: 'Extension'
    field :ifNoneExist, type:  # primitive
    embeds_one :_ifNoneExist, class_name: 'Extension'
  end
end
