module FHIR
  class RelatedPerson < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'RelatedPerson'
    embeds_many :identifier, class_name: 'Identifier'
    field :active, type:  # primitive
    embeds_one :_active, class_name: 'Extension'
    embeds_one :patient, class_name: 'Reference'
    embeds_many :relationship, class_name: 'CodeableConcept'
    embeds_many :name, class_name: 'HumanName'
    embeds_many :telecom, class_name: 'ContactPoint'
    embeds_one :gender, class_name: 'AdministrativeGender'
    field :birthDate, type:  # primitive
    embeds_one :_birthDate, class_name: 'Extension'
    embeds_many :address, class_name: 'Address'
    embeds_many :photo, class_name: 'Attachment'
    embeds_one :period, class_name: 'Period'
    embeds_many :communication, class_name: 'RelatedPersonCommunication'
  end
end
