module FHIR
  class DocumentRelationshipType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'DocumentRelationshipType'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
