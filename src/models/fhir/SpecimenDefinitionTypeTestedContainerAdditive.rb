module FHIR
  class SpecimenDefinitionTypeTestedContainerAdditive < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SpecimenDefinitionTypeTestedContainerAdditive'
    embeds_one :additiveCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :additiveReference, class_name: 'Reference'
  end
end
