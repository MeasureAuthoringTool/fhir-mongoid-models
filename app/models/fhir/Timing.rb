module FHIR
  class Timing < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'Timing'
    field :event, type: Array # primitive
    embeds_many :_event, class_name: 'Extension'
    embeds_one :repeat, class_name: 'TimingRepeat'
    embeds_one :code, class_name: 'CodeableConcept'
  end
end
