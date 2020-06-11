module FHIR
  class MedicationStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
