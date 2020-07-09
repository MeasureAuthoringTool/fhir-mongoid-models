module FHIR
  # fhir/test_report_teardown.rb
  class TestReportTeardown < BackboneElement
    include Mongoid::Document
    embeds_many :action, class_name: 'FHIR::TestReportTeardownAction'

    def self.transform_json(json_hash, target = TestReportTeardown.new)
      result = self.superclass.transform_json(json_hash, target)
      result['action'] = json_hash['action'].map { |var| TestReportTeardownAction.transform_json(var) } unless json_hash['action'].nil?

      result
    end
  end
end
