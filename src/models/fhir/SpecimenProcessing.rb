module FHIR
  class SpecimenProcessing < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SpecimenProcessing'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    embeds_one :procedure, class_name: 'CodeableConcept'
    embeds_many :additive, class_name: 'Reference'
    field :timePrimitiveDateTime, type:  # primitive
    embeds_one :_timePrimitiveDateTime, class_name: 'Extension'
    embeds_one :timePeriod, class_name: 'Period'
  end
end
