module FHIR
  class ImagingStudySeries < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ImagingStudySeries'
    field :uid, type:  # primitive
    embeds_one :_uid, class_name: 'Extension'
    field :number, type:  # primitive
    embeds_one :_number, class_name: 'Extension'
    embeds_one :modality, class_name: 'Coding'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    field :numberOfInstances, type:  # primitive
    embeds_one :_numberOfInstances, class_name: 'Extension'
    embeds_many :endpoint, class_name: 'Reference'
    embeds_one :bodySite, class_name: 'Coding'
    embeds_one :laterality, class_name: 'Coding'
    embeds_many :specimen, class_name: 'Reference'
    field :started, type:  # primitive
    embeds_one :_started, class_name: 'Extension'
    embeds_many :performer, class_name: 'ImagingStudySeriesPerformer'
    embeds_many :instance, class_name: 'ImagingStudySeriesInstance'
  end
end
