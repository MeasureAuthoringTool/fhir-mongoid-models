module FHIR
  class Consent < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'Consent'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'ConsentState'
    embeds_one :scope, class_name: 'CodeableConcept'
    embeds_many :category, class_name: 'CodeableConcept'
    embeds_one :patient, class_name: 'Reference'
    field :dateTime, type:  # primitive
    embeds_one :_dateTime, class_name: 'Extension'
    embeds_many :performer, class_name: 'Reference'
    embeds_many :organization, class_name: 'Reference'
    embeds_one :sourceAttachment, class_name: 'Attachment'
    embeds_one :sourceReference, class_name: 'Reference'
    embeds_many :policy, class_name: 'ConsentPolicy'
    embeds_one :policyRule, class_name: 'CodeableConcept'
    embeds_many :verification, class_name: 'ConsentVerification'
    embeds_one :provision, class_name: 'ConsentProvision'
  end
end
