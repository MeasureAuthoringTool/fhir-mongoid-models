module FHIR
  # fhir/supply_request_status.rb
  class SupplyRequestStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'SupplyRequestStatus'
    field :value, type: String

    def self.transform_json(json_hash)
      result = SupplyRequestStatus.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
