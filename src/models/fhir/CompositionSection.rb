module FHIR
  class CompositionSection < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'CompositionSection'
    field :title, type:  # primitive
    embeds_one :_title, class_name: 'Extension'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_many :author, class_name: 'Reference'
    embeds_one :focus, class_name: 'Reference'
    embeds_one :text, class_name: 'Narrative'
    embeds_one :mode, class_name: 'SectionMode'
    embeds_one :orderedBy, class_name: 'CodeableConcept'
    embeds_many :entry, class_name: 'Reference'
    embeds_one :emptyReason, class_name: 'CodeableConcept'
    embeds_many :section, class_name: 'CompositionSection'
  end
end
