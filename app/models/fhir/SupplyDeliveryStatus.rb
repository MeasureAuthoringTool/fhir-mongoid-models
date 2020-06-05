module FHIR
  class SupplyDeliveryStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'SupplyDeliveryStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
