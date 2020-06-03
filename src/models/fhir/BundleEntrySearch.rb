module FHIR
  class BundleEntrySearch < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'BundleEntrySearch'
    embeds_one :mode, class_name: 'SearchEntryMode'
    field :score, type:  # primitive
    embeds_one :_score, class_name: 'Extension'
  end
end
