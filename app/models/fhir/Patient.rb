module FHIR
  class Patient < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'Patient'
    embeds_many :identifier, class_name: 'Identifier'
    field :active, type:  # primitive
    embeds_one :_active, class_name: 'Extension'
    embeds_many :name, class_name: 'HumanName'
    embeds_many :telecom, class_name: 'ContactPoint'
    embeds_one :gender, class_name: 'AdministrativeGender'
    field :birthDate, type:  # primitive
    embeds_one :_birthDate, class_name: 'Extension'
    field :deceasedPrimitiveBoolean, type:  # primitive
    embeds_one :_deceasedPrimitiveBoolean, class_name: 'Extension'
    field :deceasedPrimitiveDateTime, type:  # primitive
    embeds_one :_deceasedPrimitiveDateTime, class_name: 'Extension'
    embeds_many :address, class_name: 'Address'
    embeds_one :maritalStatus, class_name: 'CodeableConcept'
    field :multipleBirthPrimitiveBoolean, type:  # primitive
    embeds_one :_multipleBirthPrimitiveBoolean, class_name: 'Extension'
    field :multipleBirthPrimitiveInteger, type:  # primitive
    embeds_one :_multipleBirthPrimitiveInteger, class_name: 'Extension'
    embeds_many :photo, class_name: 'Attachment'
    embeds_many :contact, class_name: 'PatientContact'
    embeds_many :communication, class_name: 'PatientCommunication'
    embeds_many :generalPractitioner, class_name: 'Reference'
    embeds_one :managingOrganization, class_name: 'Reference'
    embeds_many :link, class_name: 'PatientLink'
  end
end
