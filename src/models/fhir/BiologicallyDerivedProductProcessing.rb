module FHIR
  class BiologicallyDerivedProductProcessing < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'BiologicallyDerivedProductProcessing'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    embeds_one :procedure, class_name: 'CodeableConcept'
    embeds_one :additive, class_name: 'Reference'
    field :timePrimitiveDateTime, type:  # primitive
    embeds_one :_timePrimitiveDateTime, class_name: 'Extension'
    embeds_one :timePeriod, class_name: 'Period'
  end
end
