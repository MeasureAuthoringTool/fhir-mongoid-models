module FHIR
  class PropertyRepresentation < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'PropertyRepresentation'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
