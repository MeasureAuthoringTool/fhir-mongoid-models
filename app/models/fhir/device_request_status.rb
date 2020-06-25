module FHIR
  # fhir/device_request_status.rb
  class DeviceRequestStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'DeviceRequestStatus'
    field :value, type: String

    def self.transform_json(json_hash)
      result = DeviceRequestStatus.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
