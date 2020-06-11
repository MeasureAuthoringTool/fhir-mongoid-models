module FHIR
  class SpecimenStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'SpecimenStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
