module FHIR
  class CoverageEligibilityResponseError < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'CoverageEligibilityResponseError'
    embeds_one :code, class_name: 'CodeableConcept'
  end
end
