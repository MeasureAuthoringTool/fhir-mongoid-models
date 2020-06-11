module FHIR
  class ImagingStudySeriesPerformer < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ImagingStudySeriesPerformer'
    embeds_one :function, class_name: 'CodeableConcept'
    embeds_one :actor, class_name: 'Reference'
  end
end
