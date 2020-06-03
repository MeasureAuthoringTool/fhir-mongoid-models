module FHIR
  class SlotStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'SlotStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
