module FHIR
  # fhir/device_specialization.rb
  class DeviceSpecialization < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'DeviceSpecialization'
    embeds_one :systemType, class_name: 'CodeableConcept'
    embeds_one :version, class_name: 'PrimitiveString'

    def self.transform_json(json_hash)
      result = DeviceSpecialization.new
      result['systemType'] = CodeableConcept.transform_json(json_hash['systemType']) unless json_hash['systemType'].nil?      
      result['version'] = PrimitiveString.transform_json(json_hash['version'], json_hash['_version']) unless json_hash['version'].nil?      

      result
    end
  end
end
