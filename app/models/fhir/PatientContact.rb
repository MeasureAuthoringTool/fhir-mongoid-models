module FHIR
  class PatientContact < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'PatientContact'
    embeds_many :relationship, class_name: 'CodeableConcept'
    embeds_one :name, class_name: 'HumanName'
    embeds_many :telecom, class_name: 'ContactPoint'
    embeds_one :address, class_name: 'Address'
    embeds_one :gender, class_name: 'AdministrativeGender'
    embeds_one :organization, class_name: 'Reference'
    embeds_one :period, class_name: 'Period'
  end
end
