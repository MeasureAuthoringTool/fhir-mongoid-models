module FHIR
  class CompositionEvent < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'CompositionEvent'
    embeds_many :code, class_name: 'CodeableConcept'
    embeds_one :period, class_name: 'Period'
    embeds_many :detail, class_name: 'Reference'
  end
end
