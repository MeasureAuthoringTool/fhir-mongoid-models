module FHIR
  class DetectedIssueMitigation < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'DetectedIssueMitigation'
    embeds_one :action, class_name: 'CodeableConcept'
    field :date, type:  # primitive
    embeds_one :_date, class_name: 'Extension'
    embeds_one :author, class_name: 'Reference'
  end
end
