module FHIR
  class List < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'List'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'ListStatus'
    embeds_one :mode, class_name: 'ListMode'
    field :title, type:  # primitive
    embeds_one :_title, class_name: 'Extension'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_one :subject, class_name: 'Reference'
    embeds_one :encounter, class_name: 'Reference'
    field :date, type:  # primitive
    embeds_one :_date, class_name: 'Extension'
    embeds_one :source, class_name: 'Reference'
    embeds_one :orderedBy, class_name: 'CodeableConcept'
    embeds_many :note, class_name: 'Annotation'
    embeds_many :entry, class_name: 'ListEntry'
    embeds_one :emptyReason, class_name: 'CodeableConcept'
  end
end
