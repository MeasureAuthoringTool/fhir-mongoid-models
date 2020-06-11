module FHIR
  class MedicationRequestIntent < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationRequestIntent'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
