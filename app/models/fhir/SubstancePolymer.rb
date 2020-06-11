module FHIR
  class SubstancePolymer < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'SubstancePolymer'
    embeds_one :class, class_name: 'CodeableConcept'
    embeds_one :geometry, class_name: 'CodeableConcept'
    embeds_many :copolymerConnectivity, class_name: 'CodeableConcept'
    field :modification, type: Array # primitive
    embeds_many :_modification, class_name: 'Extension'
    embeds_many :monomerSet, class_name: 'SubstancePolymerMonomerSet'
    embeds_many :repeat, class_name: 'SubstancePolymerRepeat'
  end
end
