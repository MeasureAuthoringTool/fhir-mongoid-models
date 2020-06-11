module FHIR
  class ReferenceVersionRules < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ReferenceVersionRules'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
