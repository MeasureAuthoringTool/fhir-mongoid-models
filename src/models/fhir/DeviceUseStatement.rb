module FHIR
  class DeviceUseStatement < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'DeviceUseStatement'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_many :basedOn, class_name: 'Reference'
    embeds_one :status, class_name: 'DeviceUseStatementStatus'
    embeds_one :subject, class_name: 'Reference'
    embeds_many :derivedFrom, class_name: 'Reference'
    embeds_one :timingTiming, class_name: 'Timing'
    embeds_one :timingPeriod, class_name: 'Period'
    field :timingPrimitiveDateTime, type:  # primitive
    embeds_one :_timingPrimitiveDateTime, class_name: 'Extension'
    field :recordedOn, type:  # primitive
    embeds_one :_recordedOn, class_name: 'Extension'
    embeds_one :source, class_name: 'Reference'
    embeds_one :device, class_name: 'Reference'
    embeds_many :reasonCode, class_name: 'CodeableConcept'
    embeds_many :reasonReference, class_name: 'Reference'
    embeds_one :bodySite, class_name: 'CodeableConcept'
    embeds_many :note, class_name: 'Annotation'
  end
end
