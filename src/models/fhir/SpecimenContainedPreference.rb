module FHIR
  class SpecimenContainedPreference < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'SpecimenContainedPreference'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
