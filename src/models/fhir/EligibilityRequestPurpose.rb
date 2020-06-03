module FHIR
  class EligibilityRequestPurpose < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'EligibilityRequestPurpose'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
