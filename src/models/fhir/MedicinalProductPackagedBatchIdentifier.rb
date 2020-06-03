module FHIR
  class MedicinalProductPackagedBatchIdentifier < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicinalProductPackagedBatchIdentifier'
    embeds_one :outerPackaging, class_name: 'Identifier'
    embeds_one :immediatePackaging, class_name: 'Identifier'
  end
end
