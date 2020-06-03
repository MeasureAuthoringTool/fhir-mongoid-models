module FHIR
  class TestReportSetupActionOperation < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'TestReportSetupActionOperation'
    embeds_one :result, class_name: 'TestReportActionResult'
    field :message, type:  # primitive
    embeds_one :_message, class_name: 'Extension'
    field :detail, type:  # primitive
    embeds_one :_detail, class_name: 'Extension'
  end
end
