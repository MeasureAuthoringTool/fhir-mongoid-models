module FHIR
  class AdverseEventSuspectEntityCausality < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'AdverseEventSuspectEntityCausality'
    embeds_one :assessment, class_name: 'CodeableConcept'
    field :productRelatedness, type:  # primitive
    embeds_one :_productRelatedness, class_name: 'Extension'
    embeds_one :author, class_name: 'Reference'
    embeds_one :method, class_name: 'CodeableConcept'
  end
end
