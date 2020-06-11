module FHIR
  class ProvenanceAgent < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ProvenanceAgent'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_many :role, class_name: 'CodeableConcept'
    embeds_one :who, class_name: 'Reference'
    embeds_one :onBehalfOf, class_name: 'Reference'
  end
end
