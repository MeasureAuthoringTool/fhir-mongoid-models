module FHIR
  class PropertyType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'PropertyType'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
