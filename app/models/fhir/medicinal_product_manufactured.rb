module FHIR
  # fhir/medicinal_product_manufactured.rb
  class MedicinalProductManufactured < DomainResource
    include Mongoid::Document
    embeds_one :manufacturedDoseForm, class_name: 'CodeableConcept'
    embeds_one :unitOfPresentation, class_name: 'CodeableConcept'
    embeds_one :quantity, class_name: 'Quantity'
    embeds_many :manufacturer, class_name: 'Reference'
    embeds_many :ingredient, class_name: 'Reference'
    embeds_one :physicalCharacteristics, class_name: 'ProdCharacteristic'
    embeds_many :otherCharacteristics, class_name: 'CodeableConcept'

    def self.transform_json(json_hash, target = MedicinalProductManufactured.new)
      result = self.superclass.transform_json(json_hash, target)
      result['manufacturedDoseForm'] = CodeableConcept.transform_json(json_hash['manufacturedDoseForm']) unless json_hash['manufacturedDoseForm'].nil?      
      result['unitOfPresentation'] = CodeableConcept.transform_json(json_hash['unitOfPresentation']) unless json_hash['unitOfPresentation'].nil?      
      result['quantity'] = Quantity.transform_json(json_hash['quantity']) unless json_hash['quantity'].nil?      
      result['manufacturer'] = json_hash['manufacturer'].map { |var| Reference.transform_json(var) } unless json_hash['manufacturer'].nil?
      result['ingredient'] = json_hash['ingredient'].map { |var| Reference.transform_json(var) } unless json_hash['ingredient'].nil?
      result['physicalCharacteristics'] = ProdCharacteristic.transform_json(json_hash['physicalCharacteristics']) unless json_hash['physicalCharacteristics'].nil?      
      result['otherCharacteristics'] = json_hash['otherCharacteristics'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['otherCharacteristics'].nil?

      result
    end
  end
end
