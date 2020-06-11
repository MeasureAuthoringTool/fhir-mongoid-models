module FHIR
  class TestReportSetup < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'TestReportSetup'
    embeds_many :action, class_name: 'TestReportSetupAction'
  end
end
