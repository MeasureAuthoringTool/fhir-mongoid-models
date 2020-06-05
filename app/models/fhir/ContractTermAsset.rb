module FHIR
  class ContractTermAsset < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ContractTermAsset'
    embeds_one :scope, class_name: 'CodeableConcept'
    embeds_many :type, class_name: 'CodeableConcept'
    embeds_many :typeReference, class_name: 'Reference'
    embeds_many :subtype, class_name: 'CodeableConcept'
    embeds_one :relationship, class_name: 'Coding'
    embeds_many :context, class_name: 'ContractTermAssetContext'
    field :condition, type:  # primitive
    embeds_one :_condition, class_name: 'Extension'
    embeds_many :periodType, class_name: 'CodeableConcept'
    embeds_many :period, class_name: 'Period'
    embeds_many :usePeriod, class_name: 'Period'
    field :text, type:  # primitive
    embeds_one :_text, class_name: 'Extension'
    field :linkId, type: Array # primitive
    embeds_many :_linkId, class_name: 'Extension'
    embeds_many :answer, class_name: 'ContractTermOfferAnswer'
    field :securityLabelNumber, type: Array # primitive
    embeds_many :_securityLabelNumber, class_name: 'Extension'
    embeds_many :valuedItem, class_name: 'ContractTermAssetValuedItem'
  end
end
