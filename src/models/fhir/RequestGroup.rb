module FHIR
  class RequestGroup < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'RequestGroup'
    embeds_many :identifier, class_name: 'Identifier'
    field :instantiatesCanonical, type: Array # primitive
    embeds_many :_instantiatesCanonical, class_name: 'Extension'
    field :instantiatesUri, type: Array # primitive
    embeds_many :_instantiatesUri, class_name: 'Extension'
    embeds_many :basedOn, class_name: 'Reference'
    embeds_many :replaces, class_name: 'Reference'
    embeds_one :groupIdentifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'RequestStatus'
    embeds_one :intent, class_name: 'RequestIntent'
    embeds_one :priority, class_name: 'RequestPriority'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_one :subject, class_name: 'Reference'
    embeds_one :encounter, class_name: 'Reference'
    field :authoredOn, type:  # primitive
    embeds_one :_authoredOn, class_name: 'Extension'
    embeds_one :author, class_name: 'Reference'
    embeds_many :reasonCode, class_name: 'CodeableConcept'
    embeds_many :reasonReference, class_name: 'Reference'
    embeds_many :note, class_name: 'Annotation'
    embeds_many :action, class_name: 'RequestGroupAction'
  end
end
