module FHIR
  class Contract < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'Contract'
    embeds_many :identifier, class_name: 'Identifier'
    field :url, type:  # primitive
    embeds_one :_url, class_name: 'Extension'
    field :version, type:  # primitive
    embeds_one :_version, class_name: 'Extension'
    embeds_one :status, class_name: 'ContractStatus'
    embeds_one :legalState, class_name: 'CodeableConcept'
    embeds_one :instantiatesCanonical, class_name: 'Reference'
    field :instantiatesUri, type:  # primitive
    embeds_one :_instantiatesUri, class_name: 'Extension'
    embeds_one :contentDerivative, class_name: 'CodeableConcept'
    field :issued, type:  # primitive
    embeds_one :_issued, class_name: 'Extension'
    embeds_one :applies, class_name: 'Period'
    embeds_one :expirationType, class_name: 'CodeableConcept'
    embeds_many :subject, class_name: 'Reference'
    embeds_many :authority, class_name: 'Reference'
    embeds_many :domain, class_name: 'Reference'
    embeds_many :site, class_name: 'Reference'
    field :name, type:  # primitive
    embeds_one :_name, class_name: 'Extension'
    field :title, type:  # primitive
    embeds_one :_title, class_name: 'Extension'
    field :subtitle, type:  # primitive
    embeds_one :_subtitle, class_name: 'Extension'
    field :alias, type: Array # primitive
    embeds_many :_alias, class_name: 'Extension'
    embeds_one :author, class_name: 'Reference'
    embeds_one :scope, class_name: 'CodeableConcept'
    embeds_one :topicCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :topicReference, class_name: 'Reference'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_many :subType, class_name: 'CodeableConcept'
    embeds_one :contentDefinition, class_name: 'ContractContentDefinition'
    embeds_many :term, class_name: 'ContractTerm'
    embeds_many :supportingInfo, class_name: 'Reference'
    embeds_many :relevantHistory, class_name: 'Reference'
    embeds_many :signer, class_name: 'ContractSigner'
    embeds_many :friendly, class_name: 'ContractFriendly'
    embeds_many :legal, class_name: 'ContractLegal'
    embeds_many :rule, class_name: 'ContractRule'
    embeds_one :legallyBindingAttachment, class_name: 'Attachment'
    embeds_one :legallyBindingReference, class_name: 'Reference'
  end
end
