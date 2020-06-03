module FHIR
  class ChargeItemStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ChargeItemStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
