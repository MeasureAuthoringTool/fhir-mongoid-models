module FHIR
  class SubstanceNucleicAcidSubunitLinkage < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SubstanceNucleicAcidSubunitLinkage'
    field :connectivity, type:  # primitive
    embeds_one :_connectivity, class_name: 'Extension'
    embeds_one :identifier, class_name: 'Identifier'
    field :name, type:  # primitive
    embeds_one :_name, class_name: 'Extension'
    field :residueSite, type:  # primitive
    embeds_one :_residueSite, class_name: 'Extension'
  end
end
