module FHIR
  class DocumentReferenceContext < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'DocumentReferenceContext'
    embeds_many :encounter, class_name: 'Reference'
    embeds_many :event, class_name: 'CodeableConcept'
    embeds_one :period, class_name: 'Period'
    embeds_one :facilityType, class_name: 'CodeableConcept'
    embeds_one :practiceSetting, class_name: 'CodeableConcept'
    embeds_one :sourcePatientInfo, class_name: 'Reference'
    embeds_many :related, class_name: 'Reference'
  end
end
