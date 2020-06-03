module FHIR
  class SubstanceSourceMaterial < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'SubstanceSourceMaterial'
    embeds_one :sourceMaterialClass, class_name: 'CodeableConcept'
    embeds_one :sourceMaterialType, class_name: 'CodeableConcept'
    embeds_one :sourceMaterialState, class_name: 'CodeableConcept'
    embeds_one :organismId, class_name: 'Identifier'
    field :organismName, type:  # primitive
    embeds_one :_organismName, class_name: 'Extension'
    embeds_many :parentSubstanceId, class_name: 'Identifier'
    field :parentSubstanceName, type: Array # primitive
    embeds_many :_parentSubstanceName, class_name: 'Extension'
    embeds_many :countryOfOrigin, class_name: 'CodeableConcept'
    field :geographicalLocation, type: Array # primitive
    embeds_many :_geographicalLocation, class_name: 'Extension'
    embeds_one :developmentStage, class_name: 'CodeableConcept'
    embeds_many :fractionDescription, class_name: 'SubstanceSourceMaterialFractionDescription'
    embeds_one :organism, class_name: 'SubstanceSourceMaterialOrganism'
    embeds_many :partDescription, class_name: 'SubstanceSourceMaterialPartDescription'
  end
end
