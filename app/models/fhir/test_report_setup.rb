module FHIR
  # fhir/test_report_setup.rb
  class TestReportSetup < BackboneElement
    include Mongoid::Document
    embeds_many :action, class_name: 'TestReportSetupAction'

    def self.transform_json(json_hash, target = TestReportSetup.new)
      result = self.superclass.transform_json(json_hash, target)
      result['action'] = json_hash['action'].map { |var| TestReportSetupAction.transform_json(var) } unless json_hash['action'].nil?

      result
    end
  end
end
