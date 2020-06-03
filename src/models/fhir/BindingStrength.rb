module FHIR
  class BindingStrength < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'BindingStrength'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
