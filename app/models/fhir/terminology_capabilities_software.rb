module FHIR
  # fhir/terminology_capabilities_software.rb
  class TerminologyCapabilitiesSoftware < BackboneElement
    include Mongoid::Document
    embeds_one :name, class_name: 'FHIR::PrimitiveString'
    embeds_one :version, class_name: 'FHIR::PrimitiveString'

    def self.transform_json(json_hash, target = TerminologyCapabilitiesSoftware.new)
      result = self.superclass.transform_json(json_hash, target)
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?      
      result['version'] = PrimitiveString.transform_json(json_hash['version'], json_hash['_version']) unless json_hash['version'].nil?      

      result
    end
  end
end
