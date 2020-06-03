module FHIR
  class ContractTerm < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ContractTerm'
    embeds_one :identifier, class_name: 'Identifier'
    field :issued, type:  # primitive
    embeds_one :_issued, class_name: 'Extension'
    embeds_one :applies, class_name: 'Period'
    embeds_one :topicCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :topicReference, class_name: 'Reference'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :subType, class_name: 'CodeableConcept'
    field :text, type:  # primitive
    embeds_one :_text, class_name: 'Extension'
    embeds_many :securityLabel, class_name: 'ContractTermSecurityLabel'
    embeds_one :offer, class_name: 'ContractTermOffer'
    embeds_many :asset, class_name: 'ContractTermAsset'
    embeds_many :action, class_name: 'ContractTermAction'
    embeds_many :group, class_name: 'ContractTerm'
  end
end
