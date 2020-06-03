module FHIR
  class ConceptMapGroupUnmapped < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ConceptMapGroupUnmapped'
    embeds_one :mode, class_name: 'ConceptMapGroupUnmappedMode'
    field :code, type:  # primitive
    embeds_one :_code, class_name: 'Extension'
    field :display, type:  # primitive
    embeds_one :_display, class_name: 'Extension'
    field :url, type:  # primitive
    embeds_one :_url, class_name: 'Extension'
  end
end
