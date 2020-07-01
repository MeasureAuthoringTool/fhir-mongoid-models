module FHIR
  # fhir/example_scenario_instance_version.rb
  class ExampleScenarioInstanceVersion < BackboneElement
    include Mongoid::Document
    embeds_one :versionId, class_name: 'PrimitiveString'
    embeds_one :description, class_name: 'PrimitiveMarkdown'

    def self.transform_json(json_hash, target = ExampleScenarioInstanceVersion.new)
      result = self.superclass.transform_json(json_hash, target)
      result['versionId'] = PrimitiveString.transform_json(json_hash['versionId'], json_hash['_versionId']) unless json_hash['versionId'].nil?      
      result['description'] = PrimitiveMarkdown.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      

      result
    end
  end
end
