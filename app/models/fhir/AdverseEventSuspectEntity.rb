module FHIR
  class AdverseEventSuspectEntity < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'AdverseEventSuspectEntity'
    embeds_one :instance, class_name: 'Reference'
    embeds_many :causality, class_name: 'AdverseEventSuspectEntityCausality'
  end
end
