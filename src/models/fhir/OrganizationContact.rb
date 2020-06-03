module FHIR
  class OrganizationContact < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'OrganizationContact'
    embeds_one :purpose, class_name: 'CodeableConcept'
    embeds_one :name, class_name: 'HumanName'
    embeds_many :telecom, class_name: 'ContactPoint'
    embeds_one :address, class_name: 'Address'
  end
end
