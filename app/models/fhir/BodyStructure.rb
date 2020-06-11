module FHIR
  class BodyStructure < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'BodyStructure'
    embeds_many :identifier, class_name: 'Identifier'
    field :active, type:  # primitive
    embeds_one :_active, class_name: 'Extension'
    embeds_one :morphology, class_name: 'CodeableConcept'
    embeds_one :location, class_name: 'CodeableConcept'
    embeds_many :locationQualifier, class_name: 'CodeableConcept'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    embeds_many :image, class_name: 'Attachment'
    embeds_one :patient, class_name: 'Reference'
  end
end
