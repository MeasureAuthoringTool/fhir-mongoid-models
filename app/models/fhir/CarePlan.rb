module FHIR
  class CarePlan < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'CarePlan'
    embeds_many :identifier, class_name: 'Identifier'
    field :instantiatesCanonical, type: Array # primitive
    embeds_many :_instantiatesCanonical, class_name: 'Extension'
    field :instantiatesUri, type: Array # primitive
    embeds_many :_instantiatesUri, class_name: 'Extension'
    embeds_many :basedOn, class_name: 'Reference'
    embeds_many :replaces, class_name: 'Reference'
    embeds_many :partOf, class_name: 'Reference'
    embeds_one :status, class_name: 'CarePlanStatus'
    embeds_one :intent, class_name: 'CarePlanIntent'
    embeds_many :category, class_name: 'CodeableConcept'
    field :title, type:  # primitive
    embeds_one :_title, class_name: 'Extension'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    embeds_one :subject, class_name: 'Reference'
    embeds_one :encounter, class_name: 'Reference'
    embeds_one :period, class_name: 'Period'
    field :created, type:  # primitive
    embeds_one :_created, class_name: 'Extension'
    embeds_one :author, class_name: 'Reference'
    embeds_many :contributor, class_name: 'Reference'
    embeds_many :careTeam, class_name: 'Reference'
    embeds_many :addresses, class_name: 'Reference'
    embeds_many :supportingInfo, class_name: 'Reference'
    embeds_many :goal, class_name: 'Reference'
    embeds_many :activity, class_name: 'CarePlanActivity'
    embeds_many :note, class_name: 'Annotation'
  end
end
