module FHIR
  class MedicinalProductInteraction < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicinalProductInteraction'
    embeds_many :subject, class_name: 'Reference'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    embeds_many :interactant, class_name: 'MedicinalProductInteractionInteractant'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :effect, class_name: 'CodeableConcept'
    embeds_one :incidence, class_name: 'CodeableConcept'
    embeds_one :management, class_name: 'CodeableConcept'
  end
end
