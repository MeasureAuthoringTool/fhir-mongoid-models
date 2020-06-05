module FHIR
  class MeasureReportGroupStratifierStratum < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MeasureReportGroupStratifierStratum'
    embeds_one :value, class_name: 'CodeableConcept'
    embeds_many :component, class_name: 'MeasureReportGroupStratifierStratumComponent'
    embeds_many :population, class_name: 'MeasureReportGroupStratifierStratumPopulation'
    embeds_one :measureScore, class_name: 'Quantity'
  end
end
