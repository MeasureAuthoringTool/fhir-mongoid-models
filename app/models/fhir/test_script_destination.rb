module FHIR
  # fhir/test_script_destination.rb
  class TestScriptDestination < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'TestScriptDestination'
    embeds_one :index, class_name: 'PrimitiveInteger'
    embeds_one :profile, class_name: 'Coding'

    def self.transform_json(json_hash)
      result = TestScriptDestination.new
      result['index'] = PrimitiveInteger.transform_json(json_hash['index'], json_hash['_index']) unless json_hash['index'].nil?      
      result['profile'] = Coding.transform_json(json_hash['profile']) unless json_hash['profile'].nil?      

      result
    end
  end
end
