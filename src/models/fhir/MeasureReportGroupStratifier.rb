module FHIR
  class MeasureReportGroupStratifier < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MeasureReportGroupStratifier'
    embeds_many :code, class_name: 'CodeableConcept'
    embeds_many :stratum, class_name: 'MeasureReportGroupStratifierStratum'
  end
end
