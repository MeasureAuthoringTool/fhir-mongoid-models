module FHIR
  class VerificationResultPrimarySource < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'VerificationResultPrimarySource'
    embeds_one :who, class_name: 'Reference'
    embeds_many :type, class_name: 'CodeableConcept'
    embeds_many :communicationMethod, class_name: 'CodeableConcept'
    embeds_one :validationStatus, class_name: 'CodeableConcept'
    field :validationDate, type:  # primitive
    embeds_one :_validationDate, class_name: 'Extension'
    embeds_one :canPushUpdates, class_name: 'CodeableConcept'
    embeds_many :pushTypeAvailable, class_name: 'CodeableConcept'
  end
end
