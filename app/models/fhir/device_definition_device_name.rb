module FHIR
  # fhir/device_definition_device_name.rb
  class DeviceDefinitionDeviceName < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'DeviceDefinitionDeviceName'
    embeds_one :name, class_name: 'PrimitiveString'
    embeds_one :type, class_name: 'DeviceNameType'

    def self.transform_json(json_hash, target=DeviceDefinitionDeviceName.new)
      result = self.superclass.transform_json(json_hash, target)
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?      
      result['type'] = DeviceNameType.transform_json(json_hash['type']) unless json_hash['type'].nil?      

      result
    end
  end
end
