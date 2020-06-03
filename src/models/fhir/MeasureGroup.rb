module FHIR
  class MeasureGroup < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MeasureGroup'
    embeds_one :code, class_name: 'CodeableConcept'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    embeds_many :population, class_name: 'MeasureGroupPopulation'
    embeds_many :stratifier, class_name: 'MeasureGroupStratifier'
  end
end
