module FHIR
  # fhir/terminology_capabilities_code_system.rb
  class TerminologyCapabilitiesCodeSystem < BackboneElement
    include Mongoid::Document
    embeds_one :uri, class_name: 'FHIR::PrimitiveCanonical'    
    embeds_many :version, class_name: 'FHIR::TerminologyCapabilitiesCodeSystemVersion'    
    embeds_one :subsumption, class_name: 'FHIR::PrimitiveBoolean'    
    
    def as_json(*args)
      result = super      
      unless self.uri.nil? 
        result['uri'] = self.uri.value
        serialized = Extension.serializePrimitiveExtension(self.uri)            
        result['_uri'] = serialized unless serialized.nil?
      end
      unless self.version.nil?  || !self.version.any? 
        result['version'] = self.version.map{ |x| x.as_json(*args) }
      end
      unless self.subsumption.nil? 
        result['subsumption'] = self.subsumption.value
        serialized = Extension.serializePrimitiveExtension(self.subsumption)            
        result['_subsumption'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = TerminologyCapabilitiesCodeSystem.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['uri'] = PrimitiveCanonical.transform_json(json_hash['uri'], json_hash['_uri']) unless json_hash['uri'].nil?
      result['version'] = json_hash['version'].map { |var| TerminologyCapabilitiesCodeSystemVersion.transform_json(var) } unless json_hash['version'].nil?
      result['subsumption'] = PrimitiveBoolean.transform_json(json_hash['subsumption'], json_hash['_subsumption']) unless json_hash['subsumption'].nil?

      result
    end
  end
end
