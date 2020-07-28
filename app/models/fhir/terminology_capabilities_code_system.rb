module FHIR
  # fhir/terminology_capabilities_code_system.rb
  class TerminologyCapabilitiesCodeSystem < BackboneElement
    include Mongoid::Document
    embeds_one :uri, class_name: 'FHIR::PrimitiveCanonical'    
    embeds_many :version, class_name: 'FHIR::TerminologyCapabilitiesCodeSystemVersion'    
    embeds_one :subsumption, class_name: 'FHIR::PrimitiveBoolean'    

    def self.transform_json(json_hash, target = TerminologyCapabilitiesCodeSystem.new)
      result = self.superclass.transform_json(json_hash, target)
      result['uri'] = PrimitiveCanonical.transform_json(json_hash['uri'], json_hash['_uri']) unless json_hash['uri'].nil?
      result['version'] = json_hash['version'].map { |var| TerminologyCapabilitiesCodeSystemVersion.transform_json(var) } unless json_hash['version'].nil?
      result['subsumption'] = PrimitiveBoolean.transform_json(json_hash['subsumption'], json_hash['_subsumption']) unless json_hash['subsumption'].nil?

      result
    end
  end
end
