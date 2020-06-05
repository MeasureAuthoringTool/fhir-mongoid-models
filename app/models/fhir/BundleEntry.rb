module FHIR
  class BundleEntry < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'BundleEntry'
    embeds_many :link, class_name: 'BundleLink'
    field :fullUrl, type:  # primitive
    embeds_one :_fullUrl, class_name: 'Extension'
    embeds_one :resource, class_name: 'Resource'
    embeds_one :search, class_name: 'BundleEntrySearch'
    embeds_one :request, class_name: 'BundleEntryRequest'
    embeds_one :response, class_name: 'BundleEntryResponse'
  end
end
