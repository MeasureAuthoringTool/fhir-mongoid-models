module FHIR
  class FlagStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'FlagStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
