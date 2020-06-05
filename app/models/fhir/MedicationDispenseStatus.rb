module FHIR
  class MedicationDispenseStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationDispenseStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
