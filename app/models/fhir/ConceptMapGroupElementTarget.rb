module FHIR
  class ConceptMapGroupElementTarget < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ConceptMapGroupElementTarget'
    field :code, type:  # primitive
    embeds_one :_code, class_name: 'Extension'
    field :display, type:  # primitive
    embeds_one :_display, class_name: 'Extension'
    embeds_one :equivalence, class_name: 'ConceptMapEquivalence'
    field :comment, type:  # primitive
    embeds_one :_comment, class_name: 'Extension'
    embeds_many :dependsOn, class_name: 'ConceptMapGroupElementTargetDependsOn'
    embeds_many :product, class_name: 'ConceptMapGroupElementTargetDependsOn'
  end
end
