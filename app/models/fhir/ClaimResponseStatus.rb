module FHIR
  class ClaimResponseStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ClaimResponseStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
