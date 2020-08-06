module FHIR
  # fhir/example_scenario_instance_version.rb
  class ExampleScenarioInstanceVersion < BackboneElement
    include Mongoid::Document
    embeds_one :versionId, class_name: 'FHIR::PrimitiveString'    
    embeds_one :description, class_name: 'FHIR::PrimitiveMarkdown'    
    
    def as_json(*args)
      result = super      
      unless self.versionId.nil? 
        result['versionId'] = self.versionId.value
        serialized = Extension.serializePrimitiveExtension(self.versionId)            
        result['_versionId'] = serialized unless serialized.nil?
      end
      unless self.description.nil? 
        result['description'] = self.description.value
        serialized = Extension.serializePrimitiveExtension(self.description)            
        result['_description'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ExampleScenarioInstanceVersion.new)
      result = self.superclass.transform_json(json_hash, target)
      result['versionId'] = PrimitiveString.transform_json(json_hash['versionId'], json_hash['_versionId']) unless json_hash['versionId'].nil?
      result['description'] = PrimitiveMarkdown.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?

      result
    end
  end
end
