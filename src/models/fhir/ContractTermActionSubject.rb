module FHIR
  class ContractTermActionSubject < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ContractTermActionSubject'
    embeds_many :reference, class_name: 'Reference'
    embeds_one :role, class_name: 'CodeableConcept'
  end
end
