module FHIR
  class ExplanationOfBenefitCareTeam < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ExplanationOfBenefitCareTeam'
    field :sequence, type:  # primitive
    embeds_one :_sequence, class_name: 'Extension'
    embeds_one :provider, class_name: 'Reference'
    field :responsible, type:  # primitive
    embeds_one :_responsible, class_name: 'Extension'
    embeds_one :role, class_name: 'CodeableConcept'
    embeds_one :qualification, class_name: 'CodeableConcept'
  end
end
