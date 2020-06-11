module FHIR
  class ExplanationOfBenefitProcedure < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ExplanationOfBenefitProcedure'
    field :sequence, type:  # primitive
    embeds_one :_sequence, class_name: 'Extension'
    embeds_many :type, class_name: 'CodeableConcept'
    field :date, type:  # primitive
    embeds_one :_date, class_name: 'Extension'
    embeds_one :procedureCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :procedureReference, class_name: 'Reference'
    embeds_many :udi, class_name: 'Reference'
  end
end
