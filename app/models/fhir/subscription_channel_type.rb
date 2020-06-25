module FHIR
  # fhir/subscription_channel_type.rb
  class SubscriptionChannelType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'SubscriptionChannelType'
    field :value, type: String

    def self.transform_json(json_hash)
      result = SubscriptionChannelType.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
