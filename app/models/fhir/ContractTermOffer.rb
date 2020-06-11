module FHIR
  class ContractTermOffer < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ContractTermOffer'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_many :party, class_name: 'ContractTermOfferParty'
    embeds_one :topic, class_name: 'Reference'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :decision, class_name: 'CodeableConcept'
    embeds_many :decisionMode, class_name: 'CodeableConcept'
    embeds_many :answer, class_name: 'ContractTermOfferAnswer'
    field :text, type:  # primitive
    embeds_one :_text, class_name: 'Extension'
    field :linkId, type: Array # primitive
    embeds_many :_linkId, class_name: 'Extension'
    field :securityLabelNumber, type: Array # primitive
    embeds_many :_securityLabelNumber, class_name: 'Extension'
  end
end
