module FHIR
  class ClaimPayee < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ClaimPayee'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :party, class_name: 'Reference'
  end
end
