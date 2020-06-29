module FHIR
  # fhir/device_request_status.rb
  class DeviceRequestStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'DeviceRequestStatus'
    field :value, type: String

    def self.transform_json(json_hash, target=DeviceRequestStatus.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
