module FHIR
  # fhir/fhir_device_status.rb
  class FHIRDeviceStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'FHIRDeviceStatus'
    field :value, type: String

    def self.transform_json(json_hash)
      result = FHIRDeviceStatus.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
