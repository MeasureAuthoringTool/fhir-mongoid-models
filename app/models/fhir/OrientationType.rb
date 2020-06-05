module FHIR
  class OrientationType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'OrientationType'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
