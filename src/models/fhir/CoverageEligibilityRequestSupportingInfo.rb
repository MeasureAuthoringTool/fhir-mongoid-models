module FHIR
  class CoverageEligibilityRequestSupportingInfo < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'CoverageEligibilityRequestSupportingInfo'
    field :sequence, type:  # primitive
    embeds_one :_sequence, class_name: 'Extension'
    embeds_one :information, class_name: 'Reference'
    field :appliesToAll, type:  # primitive
    embeds_one :_appliesToAll, class_name: 'Extension'
  end
end
