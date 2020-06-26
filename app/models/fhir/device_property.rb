module FHIR
  # fhir/device_property.rb
  class DeviceProperty < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'DeviceProperty'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_many :valueQuantity, class_name: 'Quantity'
    embeds_many :valueCode, class_name: 'CodeableConcept'

    def self.transform_json(json_hash)
      result = DeviceProperty.new
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['valueQuantity'] = json_hash['valueQuantity'].map { |var| Quantity.transform_json(var) } unless json_hash['valueQuantity'].nil?
      result['valueCode'] = json_hash['valueCode'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['valueCode'].nil?

      result
    end
  end
end
