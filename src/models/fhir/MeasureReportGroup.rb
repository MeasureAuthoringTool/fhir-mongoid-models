module FHIR
  class MeasureReportGroup < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MeasureReportGroup'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_many :population, class_name: 'MeasureReportGroupPopulation'
    embeds_one :measureScore, class_name: 'Quantity'
    embeds_many :stratifier, class_name: 'MeasureReportGroupStratifier'
  end
end
