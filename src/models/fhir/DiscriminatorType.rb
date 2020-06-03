module FHIR
  class DiscriminatorType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'DiscriminatorType'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
