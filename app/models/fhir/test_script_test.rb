module FHIR
  # fhir/test_script_test.rb
  class TestScriptTest < BackboneElement
    include Mongoid::Document
    embeds_one :name, class_name: 'FHIR::PrimitiveString'    
    embeds_one :description, class_name: 'FHIR::PrimitiveString'    
    embeds_many :action, class_name: 'FHIR::TestScriptTestAction'    

    def self.transform_json(json_hash, target = TestScriptTest.new)
      result = self.superclass.transform_json(json_hash, target)
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['action'] = json_hash['action'].map { |var| TestScriptTestAction.transform_json(var) } unless json_hash['action'].nil?

      result
    end
  end
end
