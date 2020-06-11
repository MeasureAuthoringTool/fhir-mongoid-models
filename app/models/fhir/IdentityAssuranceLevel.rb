module FHIR
  class IdentityAssuranceLevel < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'IdentityAssuranceLevel'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
