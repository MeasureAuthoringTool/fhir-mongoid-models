module FHIR
  class StructureMapGroupRuleDependent < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'StructureMapGroupRuleDependent'
    field :name, type:  # primitive
    embeds_one :_name, class_name: 'Extension'
    field :variable, type: Array # primitive
    embeds_many :_variable, class_name: 'Extension'
  end
end
