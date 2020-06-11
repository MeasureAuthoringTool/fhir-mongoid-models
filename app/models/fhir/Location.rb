module FHIR
  class Location < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'Location'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'LocationStatus'
    embeds_one :operationalStatus, class_name: 'Coding'
    field :name, type:  # primitive
    embeds_one :_name, class_name: 'Extension'
    field :alias, type: Array # primitive
    embeds_many :_alias, class_name: 'Extension'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    embeds_one :mode, class_name: 'LocationMode'
    embeds_many :type, class_name: 'CodeableConcept'
    embeds_many :telecom, class_name: 'ContactPoint'
    embeds_one :address, class_name: 'Address'
    embeds_one :physicalType, class_name: 'CodeableConcept'
    embeds_one :position, class_name: 'LocationPosition'
    embeds_one :managingOrganization, class_name: 'Reference'
    embeds_one :partOf, class_name: 'Reference'
    embeds_many :hoursOfOperation, class_name: 'LocationHoursOfOperation'
    field :availabilityExceptions, type:  # primitive
    embeds_one :_availabilityExceptions, class_name: 'Extension'
    embeds_many :endpoint, class_name: 'Reference'
  end
end
