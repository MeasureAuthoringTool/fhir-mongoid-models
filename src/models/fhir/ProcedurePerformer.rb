module FHIR
  class ProcedurePerformer < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ProcedurePerformer'
    embeds_one :function, class_name: 'CodeableConcept'
    embeds_one :actor, class_name: 'Reference'
    embeds_one :onBehalfOf, class_name: 'Reference'
  end
end
