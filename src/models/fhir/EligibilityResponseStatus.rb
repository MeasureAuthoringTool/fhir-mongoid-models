module FHIR
  class EligibilityResponseStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'EligibilityResponseStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
