module FHIR
  class MedicationRequestStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationRequestStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
