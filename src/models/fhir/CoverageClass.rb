module FHIR
  class CoverageClass < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'CoverageClass'
    embeds_one :type, class_name: 'CodeableConcept'
    field :value, type:  # primitive
    embeds_one :_value, class_name: 'Extension'
    field :name, type:  # primitive
    embeds_one :_name, class_name: 'Extension'
  end
end
