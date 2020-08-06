module FHIR
  # fhir/example_scenario_instance.rb
  class ExampleScenarioInstance < BackboneElement
    include Mongoid::Document
    embeds_one :resourceId, class_name: 'FHIR::PrimitiveString'    
    embeds_one :resourceType, class_name: 'FHIR::FHIRResourceType'    
    embeds_one :name, class_name: 'FHIR::PrimitiveString'    
    embeds_one :description, class_name: 'FHIR::PrimitiveMarkdown'    
    embeds_many :version, class_name: 'FHIR::ExampleScenarioInstanceVersion'    
    embeds_many :containedInstance, class_name: 'FHIR::ExampleScenarioInstanceContainedInstance'    
    
    def as_json(*args)
      result = super      
      unless self.resourceId.nil? 
        result['resourceId'] = self.resourceId.value
        serialized = Extension.serializePrimitiveExtension(self.resourceId)            
        result['_resourceId'] = serialized unless serialized.nil?
      end
      unless self.resourceType.nil? 
        result['resourceType'] = self.resourceType.value
        serialized = Extension.serializePrimitiveExtension(self.resourceType)            
        result['_resourceType'] = serialized unless serialized.nil?
      end
      unless self.name.nil? 
        result['name'] = self.name.value
        serialized = Extension.serializePrimitiveExtension(self.name)            
        result['_name'] = serialized unless serialized.nil?
      end
      unless self.description.nil? 
        result['description'] = self.description.value
        serialized = Extension.serializePrimitiveExtension(self.description)            
        result['_description'] = serialized unless serialized.nil?
      end
      unless self.version.nil?  || !self.version.any? 
        result['version'] = self.version.map{ |x| x.as_json(*args) }
      end
      unless self.containedInstance.nil?  || !self.containedInstance.any? 
        result['containedInstance'] = self.containedInstance.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ExampleScenarioInstance.new)
      result = self.superclass.transform_json(json_hash, target)
      result['resourceId'] = PrimitiveString.transform_json(json_hash['resourceId'], json_hash['_resourceId']) unless json_hash['resourceId'].nil?
      result['resourceType'] = FHIRResourceType.transform_json(json_hash['resourceType'], json_hash['_resourceType']) unless json_hash['resourceType'].nil?
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?
      result['description'] = PrimitiveMarkdown.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['version'] = json_hash['version'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          ExampleScenarioInstanceVersion.transform_json(var) 
        end
      } unless json_hash['version'].nil?
      result['containedInstance'] = json_hash['containedInstance'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          ExampleScenarioInstanceContainedInstance.transform_json(var) 
        end
      } unless json_hash['containedInstance'].nil?

      result
    end
  end
end
