module FHIR
  class SubstanceNucleicAcidSubunitSugar < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SubstanceNucleicAcidSubunitSugar'
    embeds_one :identifier, class_name: 'Identifier'
    field :name, type:  # primitive
    embeds_one :_name, class_name: 'Extension'
    field :residueSite, type:  # primitive
    embeds_one :_residueSite, class_name: 'Extension'
  end
end
