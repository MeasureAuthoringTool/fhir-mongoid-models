module FHIR
  class EncounterLocation < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'EncounterLocation'
    embeds_one :location, class_name: 'Reference'
    embeds_one :status, class_name: 'EncounterLocationStatus'
    embeds_one :physicalType, class_name: 'CodeableConcept'
    embeds_one :period, class_name: 'Period'
  end
end
