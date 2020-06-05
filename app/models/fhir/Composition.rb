module FHIR
  class Composition < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'Composition'
    embeds_one :identifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'CompositionStatus'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_many :category, class_name: 'CodeableConcept'
    embeds_one :subject, class_name: 'Reference'
    embeds_one :encounter, class_name: 'Reference'
    field :date, type:  # primitive
    embeds_one :_date, class_name: 'Extension'
    embeds_many :author, class_name: 'Reference'
    field :title, type:  # primitive
    embeds_one :_title, class_name: 'Extension'
    embeds_one :confidentiality, class_name: 'DocumentConfidentiality'
    embeds_many :attester, class_name: 'CompositionAttester'
    embeds_one :custodian, class_name: 'Reference'
    embeds_many :relatesTo, class_name: 'CompositionRelatesTo'
    embeds_many :event, class_name: 'CompositionEvent'
    embeds_many :section, class_name: 'CompositionSection'
  end
end
