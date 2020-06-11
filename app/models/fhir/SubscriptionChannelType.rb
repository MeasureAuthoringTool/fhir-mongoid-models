module FHIR
  class SubscriptionChannelType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'SubscriptionChannelType'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
