module FHIR
  class TestReportTeardownAction < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'TestReportTeardownAction'
    embeds_one :operation, class_name: 'TestReportSetupActionOperation'
  end
end
