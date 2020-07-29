module FHIR
  # fhir/test_script_request_method_code.rb
  class TestScriptRequestMethodCode < Element
    include Mongoid::Document
    field :value, type: String    

    def self.transform_json(json_hash, target = TestScriptRequestMethodCode.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
