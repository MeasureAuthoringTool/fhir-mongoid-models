module FHIR
  class EligibilityRequestStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'EligibilityRequestStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
