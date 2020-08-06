module FHIR
  # fhir/example_scenario_instance_contained_instance.rb
  class ExampleScenarioInstanceContainedInstance < BackboneElement
    include Mongoid::Document
    embeds_one :resourceId, class_name: 'FHIR::PrimitiveString'    
    embeds_one :versionId, class_name: 'FHIR::PrimitiveString'    
    
    def as_json(*args)
      result = super      
      unless self.resourceId.nil? 
        result['resourceId'] = self.resourceId.value
        serialized = Extension.serializePrimitiveExtension(self.resourceId)            
        result['_resourceId'] = serialized unless serialized.nil?
      end
      unless self.versionId.nil? 
        result['versionId'] = self.versionId.value
        serialized = Extension.serializePrimitiveExtension(self.versionId)            
        result['_versionId'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ExampleScenarioInstanceContainedInstance.new)
      result = self.superclass.transform_json(json_hash, target)
      result['resourceId'] = PrimitiveString.transform_json(json_hash['resourceId'], json_hash['_resourceId']) unless json_hash['resourceId'].nil?
      result['versionId'] = PrimitiveString.transform_json(json_hash['versionId'], json_hash['_versionId']) unless json_hash['versionId'].nil?

      result
    end
  end
end
