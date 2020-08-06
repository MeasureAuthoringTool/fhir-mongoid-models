module FHIR
  # fhir/example_scenario_actor.rb
  class ExampleScenarioActor < BackboneElement
    include Mongoid::Document
    embeds_one :actorId, class_name: 'FHIR::PrimitiveString'    
    embeds_one :type, class_name: 'FHIR::ExampleScenarioActorType'    
    embeds_one :name, class_name: 'FHIR::PrimitiveString'    
    embeds_one :description, class_name: 'FHIR::PrimitiveMarkdown'    
    
    def as_json(*args)
      result = super      
      unless self.actorId.nil? 
        result['actorId'] = self.actorId.value
        serialized = Extension.serializePrimitiveExtension(self.actorId)            
        result['_actorId'] = serialized unless serialized.nil?
      end
      unless self.type.nil? 
        result['type'] = self.type.value
        serialized = Extension.serializePrimitiveExtension(self.type)            
        result['_type'] = serialized unless serialized.nil?
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
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ExampleScenarioActor.new)
      result = self.superclass.transform_json(json_hash, target)
      result['actorId'] = PrimitiveString.transform_json(json_hash['actorId'], json_hash['_actorId']) unless json_hash['actorId'].nil?
      result['type'] = ExampleScenarioActorType.transform_json(json_hash['type'], json_hash['_type']) unless json_hash['type'].nil?
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?
      result['description'] = PrimitiveMarkdown.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?

      result
    end
  end
end
