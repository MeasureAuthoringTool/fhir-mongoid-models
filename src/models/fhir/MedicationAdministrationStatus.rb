module FHIR
  class MedicationAdministrationStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationAdministrationStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
