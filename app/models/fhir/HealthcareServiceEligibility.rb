module FHIR
  class HealthcareServiceEligibility < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'HealthcareServiceEligibility'
    embeds_one :code, class_name: 'CodeableConcept'
    field :comment, type:  # primitive
    embeds_one :_comment, class_name: 'Extension'
  end
end
