module FHIR
  class TestReportStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'TestReportStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
