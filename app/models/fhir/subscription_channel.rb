module FHIR
  # fhir/subscription_channel.rb
  class SubscriptionChannel < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::SubscriptionChannelType'    
    embeds_one :endpoint, class_name: 'FHIR::PrimitiveUrl'    
    embeds_one :payload, class_name: 'FHIR::MimeType'    
    embeds_many :header, class_name: 'FHIR::PrimitiveString'    

    def self.transform_json(json_hash, target = SubscriptionChannel.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = SubscriptionChannelType.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['endpoint'] = PrimitiveUrl.transform_json(json_hash['endpoint'], json_hash['_endpoint']) unless json_hash['endpoint'].nil?
      result['payload'] = MimeType.transform_json(json_hash['payload']) unless json_hash['payload'].nil?
      result['header'] = json_hash['header'].each_with_index.map do |var, i|
        extension_hash = json_hash['_header'] && json_hash['_header'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['header'].nil?

      result
    end
  end
end
