module FHIR
  class Specimen < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'Specimen'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :accessionIdentifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'SpecimenStatus'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :subject, class_name: 'Reference'
    field :receivedTime, type:  # primitive
    embeds_one :_receivedTime, class_name: 'Extension'
    embeds_many :parent, class_name: 'Reference'
    embeds_many :request, class_name: 'Reference'
    embeds_one :collection, class_name: 'SpecimenCollection'
    embeds_many :processing, class_name: 'SpecimenProcessing'
    embeds_many :container, class_name: 'SpecimenContainer'
    embeds_many :condition, class_name: 'CodeableConcept'
    embeds_many :note, class_name: 'Annotation'
  end
end
