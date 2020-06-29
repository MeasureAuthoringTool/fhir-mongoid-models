module FHIR
  # fhir/subscription.rb
  class Subscription < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'Subscription'
    embeds_one :status, class_name: 'SubscriptionStatus'
    embeds_many :contact, class_name: 'ContactPoint'
    embeds_one :end, class_name: 'PrimitiveInstant'
    embeds_one :reason, class_name: 'PrimitiveString'
    embeds_one :criteria, class_name: 'PrimitiveString'
    embeds_one :error, class_name: 'PrimitiveString'
    embeds_one :channel, class_name: 'SubscriptionChannel'

    def self.transform_json(json_hash, target=Subscription.new)
      result = self.superclass.transform_json(json_hash, target)
      result['status'] = SubscriptionStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['contact'] = json_hash['contact'].map { |var| ContactPoint.transform_json(var) } unless json_hash['contact'].nil?
      result['end'] = PrimitiveInstant.transform_json(json_hash['end'], json_hash['_end']) unless json_hash['end'].nil?      
      result['reason'] = PrimitiveString.transform_json(json_hash['reason'], json_hash['_reason']) unless json_hash['reason'].nil?      
      result['criteria'] = PrimitiveString.transform_json(json_hash['criteria'], json_hash['_criteria']) unless json_hash['criteria'].nil?      
      result['error'] = PrimitiveString.transform_json(json_hash['error'], json_hash['_error']) unless json_hash['error'].nil?      
      result['channel'] = SubscriptionChannel.transform_json(json_hash['channel']) unless json_hash['channel'].nil?      

      result
    end
  end
end
