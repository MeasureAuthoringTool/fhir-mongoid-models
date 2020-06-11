module FHIR
  class MedicinalProductPackagedPackageItem < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicinalProductPackagedPackageItem'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :quantity, class_name: 'Quantity'
    embeds_many :material, class_name: 'CodeableConcept'
    embeds_many :alternateMaterial, class_name: 'CodeableConcept'
    embeds_many :device, class_name: 'Reference'
    embeds_many :manufacturedItem, class_name: 'Reference'
    embeds_many :packageItem, class_name: 'MedicinalProductPackagedPackageItem'
    embeds_one :physicalCharacteristics, class_name: 'ProdCharacteristic'
    embeds_many :otherCharacteristics, class_name: 'CodeableConcept'
    embeds_many :shelfLifeStorage, class_name: 'ProductShelfLife'
    embeds_many :manufacturer, class_name: 'Reference'
  end
end
