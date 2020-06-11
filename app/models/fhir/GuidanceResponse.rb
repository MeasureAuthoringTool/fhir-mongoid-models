module FHIR
  class GuidanceResponse < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'GuidanceResponse'
    embeds_one :requestIdentifier, class_name: 'Identifier'
    embeds_many :identifier, class_name: 'Identifier'
    field :modulePrimitiveUri, type:  # primitive
    embeds_one :_modulePrimitiveUri, class_name: 'Extension'
    field :modulePrimitiveCanonical, type:  # primitive
    embeds_one :_modulePrimitiveCanonical, class_name: 'Extension'
    embeds_one :moduleCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :status, class_name: 'GuidanceResponseStatus'
    embeds_one :subject, class_name: 'Reference'
    embeds_one :encounter, class_name: 'Reference'
    field :occurrenceDateTime, type:  # primitive
    embeds_one :_occurrenceDateTime, class_name: 'Extension'
    embeds_one :performer, class_name: 'Reference'
    embeds_many :reasonCode, class_name: 'CodeableConcept'
    embeds_many :reasonReference, class_name: 'Reference'
    embeds_many :note, class_name: 'Annotation'
    embeds_many :evaluationMessage, class_name: 'Reference'
    embeds_one :outputParameters, class_name: 'Reference'
    embeds_one :result, class_name: 'Reference'
    embeds_many :dataRequirement, class_name: 'DataRequirement'
  end
end
