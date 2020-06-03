module FHIR
  class CompositionRelatesTo < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'CompositionRelatesTo'
    embeds_one :code, class_name: 'DocumentRelationshipType'
    embeds_one :targetIdentifier, class_name: 'Identifier'
    embeds_one :targetReference, class_name: 'Reference'
  end
end
