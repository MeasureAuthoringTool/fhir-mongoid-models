module FHIR
  class Practitioner < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'Practitioner'
    embeds_many :identifier, class_name: 'Identifier'
    field :active, type:  # primitive
    embeds_one :_active, class_name: 'Extension'
    embeds_many :name, class_name: 'HumanName'
    embeds_many :telecom, class_name: 'ContactPoint'
    embeds_many :address, class_name: 'Address'
    embeds_one :gender, class_name: 'AdministrativeGender'
    field :birthDate, type:  # primitive
    embeds_one :_birthDate, class_name: 'Extension'
    embeds_many :photo, class_name: 'Attachment'
    embeds_many :qualification, class_name: 'PractitionerQualification'
    embeds_many :communication, class_name: 'CodeableConcept'
  end
end
