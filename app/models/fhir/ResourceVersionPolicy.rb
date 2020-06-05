module FHIR
  class ResourceVersionPolicy < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ResourceVersionPolicy'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
