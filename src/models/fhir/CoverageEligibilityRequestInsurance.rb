module FHIR
  class CoverageEligibilityRequestInsurance < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'CoverageEligibilityRequestInsurance'
    field :focal, type:  # primitive
    embeds_one :_focal, class_name: 'Extension'
    embeds_one :coverage, class_name: 'Reference'
    field :businessArrangement, type:  # primitive
    embeds_one :_businessArrangement, class_name: 'Extension'
  end
end
