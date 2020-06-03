module FHIR
  class ActionRelationshipType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ActionRelationshipType'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
