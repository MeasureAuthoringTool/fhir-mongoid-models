module FHIR
  class ProcedureFocalDevice < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ProcedureFocalDevice'
    embeds_one :action, class_name: 'CodeableConcept'
    embeds_one :manipulated, class_name: 'Reference'
  end
end
