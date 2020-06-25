module FHIR
  # fhir/supply_delivery_status.rb
  class SupplyDeliveryStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'SupplyDeliveryStatus'
    field :value, type: String

    def self.transform_json(json_hash)
      result = SupplyDeliveryStatus.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
