module FHIR
  class TestReportSetupAction < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'TestReportSetupAction'
    embeds_one :operation, class_name: 'TestReportSetupActionOperation'
    embeds_one :assert, class_name: 'TestReportSetupActionAssert'
  end
end
