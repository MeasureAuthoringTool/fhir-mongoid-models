module FHIR
  class BundleLink < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'BundleLink'
    field :relation, type:  # primitive
    embeds_one :_relation, class_name: 'Extension'
    field :url, type:  # primitive
    embeds_one :_url, class_name: 'Extension'
  end
end
