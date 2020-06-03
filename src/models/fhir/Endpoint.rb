module FHIR
  class Endpoint < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'Endpoint'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'EndpointStatus'
    embeds_one :connectionType, class_name: 'Coding'
    field :name, type:  # primitive
    embeds_one :_name, class_name: 'Extension'
    embeds_one :managingOrganization, class_name: 'Reference'
    embeds_many :contact, class_name: 'ContactPoint'
    embeds_one :period, class_name: 'Period'
    embeds_many :payloadType, class_name: 'CodeableConcept'
    embeds_many :payloadMimeType, class_name: 'MimeType'
    field :address, type:  # primitive
    embeds_one :_address, class_name: 'Extension'
    field :header, type: Array # primitive
    embeds_many :_header, class_name: 'Extension'
  end
end
