module FHIR
  class MedicationStatementStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationStatementStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
