module FHIR
  # fhir/test_script_fixture.rb
  class TestScriptFixture < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'TestScriptFixture'
    embeds_one :autocreate, class_name: 'PrimitiveBoolean'
    embeds_one :autodelete, class_name: 'PrimitiveBoolean'
    embeds_one :resource, class_name: 'Reference'

    def self.transform_json(json_hash)
      result = TestScriptFixture.new
      result['autocreate'] = PrimitiveBoolean.transform_json(json_hash['autocreate'], json_hash['_autocreate']) unless json_hash['autocreate'].nil?      
      result['autodelete'] = PrimitiveBoolean.transform_json(json_hash['autodelete'], json_hash['_autodelete']) unless json_hash['autodelete'].nil?      
      result['resource'] = Reference.transform_json(json_hash['resource']) unless json_hash['resource'].nil?      

      result
    end
  end
end
