module FHIR
  class Organization < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'Organization'
    embeds_many :identifier, class_name: 'Identifier'
    field :active, type:  # primitive
    embeds_one :_active, class_name: 'Extension'
    embeds_many :type, class_name: 'CodeableConcept'
    field :name, type:  # primitive
    embeds_one :_name, class_name: 'Extension'
    field :alias, type: Array # primitive
    embeds_many :_alias, class_name: 'Extension'
    embeds_many :telecom, class_name: 'ContactPoint'
    embeds_many :address, class_name: 'Address'
    embeds_one :partOf, class_name: 'Reference'
    embeds_many :contact, class_name: 'OrganizationContact'
    embeds_many :endpoint, class_name: 'Reference'
  end
end
