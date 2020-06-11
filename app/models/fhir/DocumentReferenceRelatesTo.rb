module FHIR
  class DocumentReferenceRelatesTo < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'DocumentReferenceRelatesTo'
    embeds_one :code, class_name: 'DocumentRelationshipType'
    embeds_one :target, class_name: 'Reference'
  end
end
