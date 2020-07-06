module FHIR
  # fhir/medicinal_product_packaged_package_item.rb
  class MedicinalProductPackagedPackageItem < BackboneElement
    include Mongoid::Document
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

    def self.transform_json(json_hash, target = MedicinalProductPackagedPackageItem.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['quantity'] = Quantity.transform_json(json_hash['quantity']) unless json_hash['quantity'].nil?      
      result['material'] = json_hash['material'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['material'].nil?
      result['alternateMaterial'] = json_hash['alternateMaterial'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['alternateMaterial'].nil?
      result['device'] = json_hash['device'].map { |var| Reference.transform_json(var) } unless json_hash['device'].nil?
      result['manufacturedItem'] = json_hash['manufacturedItem'].map { |var| Reference.transform_json(var) } unless json_hash['manufacturedItem'].nil?
      result['packageItem'] = json_hash['packageItem'].map { |var| MedicinalProductPackagedPackageItem.transform_json(var) } unless json_hash['packageItem'].nil?
      result['physicalCharacteristics'] = ProdCharacteristic.transform_json(json_hash['physicalCharacteristics']) unless json_hash['physicalCharacteristics'].nil?      
      result['otherCharacteristics'] = json_hash['otherCharacteristics'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['otherCharacteristics'].nil?
      result['shelfLifeStorage'] = json_hash['shelfLifeStorage'].map { |var| ProductShelfLife.transform_json(var) } unless json_hash['shelfLifeStorage'].nil?
      result['manufacturer'] = json_hash['manufacturer'].map { |var| Reference.transform_json(var) } unless json_hash['manufacturer'].nil?

      result
    end
  end
end
