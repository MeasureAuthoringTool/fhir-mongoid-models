module FHIR
  class SubstanceProtein < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'SubstanceProtein'
    embeds_one :sequenceType, class_name: 'CodeableConcept'
    field :numberOfSubunits, type:  # primitive
    embeds_one :_numberOfSubunits, class_name: 'Extension'
    field :disulfideLinkage, type: Array # primitive
    embeds_many :_disulfideLinkage, class_name: 'Extension'
    embeds_many :subunit, class_name: 'SubstanceProteinSubunit'
  end
end
