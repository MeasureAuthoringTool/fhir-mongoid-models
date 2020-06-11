module FHIR
  class SubstanceNucleicAcid < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'SubstanceNucleicAcid'
    embeds_one :sequenceType, class_name: 'CodeableConcept'
    field :numberOfSubunits, type:  # primitive
    embeds_one :_numberOfSubunits, class_name: 'Extension'
    field :areaOfHybridisation, type:  # primitive
    embeds_one :_areaOfHybridisation, class_name: 'Extension'
    embeds_one :oligoNucleotideType, class_name: 'CodeableConcept'
    embeds_many :subunit, class_name: 'SubstanceNucleicAcidSubunit'
  end
end
