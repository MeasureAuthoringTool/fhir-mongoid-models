module FHIR
  class ContractTermOfferParty < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ContractTermOfferParty'
    embeds_many :reference, class_name: 'Reference'
    embeds_one :role, class_name: 'CodeableConcept'
  end
end
