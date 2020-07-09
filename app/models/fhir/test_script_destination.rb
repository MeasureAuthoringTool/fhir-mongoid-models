module FHIR
  # fhir/test_script_destination.rb
  class TestScriptDestination < BackboneElement
    include Mongoid::Document
    embeds_one :index, class_name: 'FHIR::PrimitiveInteger'
    embeds_one :profile, class_name: 'FHIR::Coding'

    def self.transform_json(json_hash, target = TestScriptDestination.new)
      result = self.superclass.transform_json(json_hash, target)
      result['index'] = PrimitiveInteger.transform_json(json_hash['index'], json_hash['_index']) unless json_hash['index'].nil?      
      result['profile'] = Coding.transform_json(json_hash['profile']) unless json_hash['profile'].nil?      

      result
    end
  end
end
