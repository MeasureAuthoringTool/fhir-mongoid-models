module FHIR
  class TestReportResult < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'TestReportResult'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
