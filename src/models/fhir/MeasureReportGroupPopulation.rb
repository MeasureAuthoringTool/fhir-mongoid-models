module FHIR
  class MeasureReportGroupPopulation < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MeasureReportGroupPopulation'
    embeds_one :code, class_name: 'CodeableConcept'
    field :count, type:  # primitive
    embeds_one :_count, class_name: 'Extension'
    embeds_one :subjectResults, class_name: 'Reference'
  end
end
