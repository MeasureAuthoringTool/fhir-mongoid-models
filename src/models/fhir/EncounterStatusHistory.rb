module FHIR
  class EncounterStatusHistory < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'EncounterStatusHistory'
    embeds_one :status, class_name: 'EncounterStatus'
    embeds_one :period, class_name: 'Period'
  end
end
