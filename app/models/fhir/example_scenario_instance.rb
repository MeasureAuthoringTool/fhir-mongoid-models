module FHIR
  # fhir/example_scenario_instance.rb
  class ExampleScenarioInstance < BackboneElement
    include Mongoid::Document
    embeds_one :resourceId, class_name: 'PrimitiveString'
    embeds_one :resourceType, class_name: 'FHIRResourceType'
    embeds_one :name, class_name: 'PrimitiveString'
    embeds_one :description, class_name: 'PrimitiveMarkdown'
    embeds_many :version, class_name: 'ExampleScenarioInstanceVersion'
    embeds_many :containedInstance, class_name: 'ExampleScenarioInstanceContainedInstance'

    def self.transform_json(json_hash, target = ExampleScenarioInstance.new)
      result = self.superclass.transform_json(json_hash, target)
      result['resourceId'] = PrimitiveString.transform_json(json_hash['resourceId'], json_hash['_resourceId']) unless json_hash['resourceId'].nil?      
      result['resourceType'] = FHIRResourceType.transform_json(json_hash['resourceType']) unless json_hash['resourceType'].nil?      
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?      
      result['description'] = PrimitiveMarkdown.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['version'] = json_hash['version'].map { |var| ExampleScenarioInstanceVersion.transform_json(var) } unless json_hash['version'].nil?
      result['containedInstance'] = json_hash['containedInstance'].map { |var| ExampleScenarioInstanceContainedInstance.transform_json(var) } unless json_hash['containedInstance'].nil?

      result
    end
  end
end
