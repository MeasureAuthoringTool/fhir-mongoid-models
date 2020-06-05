module FHIR
  class Media < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'Media'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_many :basedOn, class_name: 'Reference'
    embeds_many :partOf, class_name: 'Reference'
    embeds_one :status, class_name: 'MediaStatus'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :modality, class_name: 'CodeableConcept'
    embeds_one :view, class_name: 'CodeableConcept'
    embeds_one :subject, class_name: 'Reference'
    embeds_one :encounter, class_name: 'Reference'
    field :createdPrimitiveDateTime, type:  # primitive
    embeds_one :_createdPrimitiveDateTime, class_name: 'Extension'
    embeds_one :createdPeriod, class_name: 'Period'
    field :issued, type:  # primitive
    embeds_one :_issued, class_name: 'Extension'
    embeds_one :operator, class_name: 'Reference'
    embeds_many :reasonCode, class_name: 'CodeableConcept'
    embeds_one :bodySite, class_name: 'CodeableConcept'
    field :deviceName, type:  # primitive
    embeds_one :_deviceName, class_name: 'Extension'
    embeds_one :device, class_name: 'Reference'
    field :height, type:  # primitive
    embeds_one :_height, class_name: 'Extension'
    field :width, type:  # primitive
    embeds_one :_width, class_name: 'Extension'
    field :frames, type:  # primitive
    embeds_one :_frames, class_name: 'Extension'
    field :duration, type:  # primitive
    embeds_one :_duration, class_name: 'Extension'
    embeds_one :content, class_name: 'Attachment'
    embeds_many :note, class_name: 'Annotation'
  end
end
