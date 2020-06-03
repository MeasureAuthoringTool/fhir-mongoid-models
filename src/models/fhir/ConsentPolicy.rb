module FHIR
  class ConsentPolicy < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ConsentPolicy'
    field :authority, type:  # primitive
    embeds_one :_authority, class_name: 'Extension'
    field :uri, type:  # primitive
    embeds_one :_uri, class_name: 'Extension'
  end
end
