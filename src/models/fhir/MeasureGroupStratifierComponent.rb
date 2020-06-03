module FHIR
  class MeasureGroupStratifierComponent < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MeasureGroupStratifierComponent'
    embeds_one :code, class_name: 'CodeableConcept'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    embeds_one :criteria, class_name: 'Expression'
  end
end
