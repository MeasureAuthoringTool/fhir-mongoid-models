module FHIR
  # fhir/test_report_test.rb
  class TestReportTest < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'TestReportTest'
    embeds_one :name, class_name: 'PrimitiveString'
    embeds_one :description, class_name: 'PrimitiveString'
    embeds_many :action, class_name: 'TestReportTestAction'

    def self.transform_json(json_hash, target=TestReportTest.new)
      result = self.superclass.transform_json(json_hash, target)
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?      
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['action'] = json_hash['action'].map { |var| TestReportTestAction.transform_json(var) } unless json_hash['action'].nil?

      result
    end
  end
end
