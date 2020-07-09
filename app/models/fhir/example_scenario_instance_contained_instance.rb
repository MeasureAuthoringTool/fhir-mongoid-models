module FHIR
  # fhir/example_scenario_instance_contained_instance.rb
  class ExampleScenarioInstanceContainedInstance < BackboneElement
    include Mongoid::Document
    embeds_one :resourceId, class_name: 'FHIR::PrimitiveString'
    embeds_one :versionId, class_name: 'FHIR::PrimitiveString'

    def self.transform_json(json_hash, target = ExampleScenarioInstanceContainedInstance.new)
      result = self.superclass.transform_json(json_hash, target)
      result['resourceId'] = PrimitiveString.transform_json(json_hash['resourceId'], json_hash['_resourceId']) unless json_hash['resourceId'].nil?      
      result['versionId'] = PrimitiveString.transform_json(json_hash['versionId'], json_hash['_versionId']) unless json_hash['versionId'].nil?      

      result
    end
  end
end
