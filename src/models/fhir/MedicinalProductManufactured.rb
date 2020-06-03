module FHIR
  class MedicinalProductManufactured < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicinalProductManufactured'
    embeds_one :manufacturedDoseForm, class_name: 'CodeableConcept'
    embeds_one :unitOfPresentation, class_name: 'CodeableConcept'
    embeds_one :quantity, class_name: 'Quantity'
    embeds_many :manufacturer, class_name: 'Reference'
    embeds_many :ingredient, class_name: 'Reference'
    embeds_one :physicalCharacteristics, class_name: 'ProdCharacteristic'
    embeds_many :otherCharacteristics, class_name: 'CodeableConcept'
  end
end
