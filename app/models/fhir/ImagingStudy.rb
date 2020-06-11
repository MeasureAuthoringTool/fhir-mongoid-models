module FHIR
  class ImagingStudy < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'ImagingStudy'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'ImagingStudyStatus'
    embeds_many :modality, class_name: 'Coding'
    embeds_one :subject, class_name: 'Reference'
    embeds_one :encounter, class_name: 'Reference'
    field :started, type:  # primitive
    embeds_one :_started, class_name: 'Extension'
    embeds_many :basedOn, class_name: 'Reference'
    embeds_one :referrer, class_name: 'Reference'
    embeds_many :interpreter, class_name: 'Reference'
    embeds_many :endpoint, class_name: 'Reference'
    field :numberOfSeries, type:  # primitive
    embeds_one :_numberOfSeries, class_name: 'Extension'
    field :numberOfInstances, type:  # primitive
    embeds_one :_numberOfInstances, class_name: 'Extension'
    embeds_one :procedureReference, class_name: 'Reference'
    embeds_many :procedureCode, class_name: 'CodeableConcept'
    embeds_one :location, class_name: 'Reference'
    embeds_many :reasonCode, class_name: 'CodeableConcept'
    embeds_many :reasonReference, class_name: 'Reference'
    embeds_many :note, class_name: 'Annotation'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    embeds_many :series, class_name: 'ImagingStudySeries'
  end
end
