module FHIR
  # fhir/device_name_type.rb
  class DeviceNameType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'DeviceNameType'
    field :value, type: String

    def self.transform_json(json_hash, target=DeviceNameType.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
