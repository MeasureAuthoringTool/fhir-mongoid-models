module FHIR
  # fhir/device_specialization.rb
  class DeviceSpecialization < BackboneElement
    include Mongoid::Document
    embeds_one :systemType, class_name: 'FHIR::CodeableConcept'
    embeds_one :version, class_name: 'FHIR::PrimitiveString'

    def self.transform_json(json_hash, target = DeviceSpecialization.new)
      result = self.superclass.transform_json(json_hash, target)
      result['systemType'] = CodeableConcept.transform_json(json_hash['systemType']) unless json_hash['systemType'].nil?      
      result['version'] = PrimitiveString.transform_json(json_hash['version'], json_hash['_version']) unless json_hash['version'].nil?      

      result
    end
  end
end
