module FHIR
  class CompositionStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'CompositionStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
