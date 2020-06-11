module FHIR
  class MedicationBatch < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationBatch'
    field :lotNumber, type:  # primitive
    embeds_one :_lotNumber, class_name: 'Extension'
    field :expirationDate, type:  # primitive
    embeds_one :_expirationDate, class_name: 'Extension'
  end
end
