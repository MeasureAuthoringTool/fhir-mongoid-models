module FHIR
  class SpecimenDefinitionTypeTestedHandling < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SpecimenDefinitionTypeTestedHandling'
    embeds_one :temperatureQualifier, class_name: 'CodeableConcept'
    embeds_one :temperatureRange, class_name: 'Range'
    embeds_one :maxDuration, class_name: 'Duration'
    field :instruction, type:  # primitive
    embeds_one :_instruction, class_name: 'Extension'
  end
end
