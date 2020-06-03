module FHIR
  class CodeSystemConceptDesignation < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'CodeSystemConceptDesignation'
    field :language, type:  # primitive
    embeds_one :_language, class_name: 'Extension'
    embeds_one :use, class_name: 'Coding'
    field :value, type:  # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
