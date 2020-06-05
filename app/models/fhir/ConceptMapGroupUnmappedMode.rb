module FHIR
  class ConceptMapGroupUnmappedMode < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ConceptMapGroupUnmappedMode'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
