module FHIR
  class ImmunizationStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ImmunizationStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
