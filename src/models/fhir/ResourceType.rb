module FHIR
  class ResourceType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ResourceType'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
