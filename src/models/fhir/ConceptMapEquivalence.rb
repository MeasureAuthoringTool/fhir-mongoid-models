module FHIR
  class ConceptMapEquivalence < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ConceptMapEquivalence'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
