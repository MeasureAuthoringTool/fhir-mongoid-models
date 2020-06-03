module FHIR
  class ConceptMapGroupElement < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ConceptMapGroupElement'
    field :code, type:  # primitive
    embeds_one :_code, class_name: 'Extension'
    field :display, type:  # primitive
    embeds_one :_display, class_name: 'Extension'
    embeds_many :target, class_name: 'ConceptMapGroupElementTarget'
  end
end
