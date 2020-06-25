module FHIR
  # fhir/test_script_request_method_code.rb
  class TestScriptRequestMethodCode < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'TestScriptRequestMethodCode'
    field :value, type: String

    def self.transform_json(json_hash)
      result = TestScriptRequestMethodCode.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
