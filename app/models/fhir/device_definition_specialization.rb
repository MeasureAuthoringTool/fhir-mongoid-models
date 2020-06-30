module FHIR
  # fhir/device_definition_specialization.rb
  class DeviceDefinitionSpecialization < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'DeviceDefinitionSpecialization'
    embeds_one :systemType, class_name: 'PrimitiveString'
    embeds_one :version, class_name: 'PrimitiveString'

    def self.transform_json(json_hash, target=DeviceDefinitionSpecialization.new)
      result = self.superclass.transform_json(json_hash, target)
      result['systemType'] = PrimitiveString.transform_json(json_hash['systemType'], json_hash['_systemType']) unless json_hash['systemType'].nil?      
      result['version'] = PrimitiveString.transform_json(json_hash['version'], json_hash['_version']) unless json_hash['version'].nil?      

      result
    end
  end
end
