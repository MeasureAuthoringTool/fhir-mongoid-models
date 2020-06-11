module FHIR
  class Person < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'Person'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_many :name, class_name: 'HumanName'
    embeds_many :telecom, class_name: 'ContactPoint'
    embeds_one :gender, class_name: 'AdministrativeGender'
    field :birthDate, type:  # primitive
    embeds_one :_birthDate, class_name: 'Extension'
    embeds_many :address, class_name: 'Address'
    embeds_one :photo, class_name: 'Attachment'
    embeds_one :managingOrganization, class_name: 'Reference'
    field :active, type:  # primitive
    embeds_one :_active, class_name: 'Extension'
    embeds_many :link, class_name: 'PersonLink'
  end
end
