module FHIR
  # fhir/example_scenario_actor.rb
  class ExampleScenarioActor < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ExampleScenarioActor'
    embeds_one :actorId, class_name: 'PrimitiveString'
    embeds_one :type, class_name: 'ExampleScenarioActorType'
    embeds_one :name, class_name: 'PrimitiveString'
    embeds_one :description, class_name: 'PrimitiveMarkdown'

    def self.transform_json(json_hash)
      result = ExampleScenarioActor.new
      result['actorId'] = PrimitiveString.transform_json(json_hash['actorId'], json_hash['_actorId']) unless json_hash['actorId'].nil?      
      result['type'] = ExampleScenarioActorType.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?      
      result['description'] = PrimitiveMarkdown.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      

      result
    end
  end
end
