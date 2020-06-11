module FHIR
  class MeasureReportGroupStratifierStratumComponent < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MeasureReportGroupStratifierStratumComponent'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_one :value, class_name: 'CodeableConcept'
  end
end
