module FHIR
  class TestReportTeardown < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'TestReportTeardown'
    embeds_many :action, class_name: 'TestReportTeardownAction'
  end
end
