module FHIR
  class SpecimenDefinitionTypeTested < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SpecimenDefinitionTypeTested'
    field :isDerived, type:  # primitive
    embeds_one :_isDerived, class_name: 'Extension'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :preference, class_name: 'SpecimenContainedPreference'
    embeds_one :container, class_name: 'SpecimenDefinitionTypeTestedContainer'
    field :requirement, type:  # primitive
    embeds_one :_requirement, class_name: 'Extension'
    embeds_one :retentionTime, class_name: 'Duration'
    embeds_many :rejectionCriterion, class_name: 'CodeableConcept'
    embeds_many :handling, class_name: 'SpecimenDefinitionTypeTestedHandling'
  end
end
