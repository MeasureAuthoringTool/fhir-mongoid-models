module FHIR
  class SubscriptionStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'SubscriptionStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
