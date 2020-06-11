module FHIR
  class MeasureGroupStratifier < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MeasureGroupStratifier'
    embeds_one :code, class_name: 'CodeableConcept'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    embeds_one :criteria, class_name: 'Expression'
    embeds_many :component, class_name: 'MeasureGroupStratifierComponent'
  end
end
