module FHIR
  # fhir/medicinal_product_manufactured.rb
  class MedicinalProductManufactured < DomainResource
    include Mongoid::Document
    embeds_one :manufacturedDoseForm, class_name: 'FHIR::CodeableConcept'    
    embeds_one :unitOfPresentation, class_name: 'FHIR::CodeableConcept'    
    embeds_one :quantity, class_name: 'FHIR::Quantity'    
    embeds_many :manufacturer, class_name: 'FHIR::Reference'    
    embeds_many :ingredient, class_name: 'FHIR::Reference'    
    embeds_one :physicalCharacteristics, class_name: 'FHIR::ProdCharacteristic'    
    embeds_many :otherCharacteristics, class_name: 'FHIR::CodeableConcept'    
    
    def as_json(*args)
      result = super      
      unless self.manufacturedDoseForm.nil? 
        result['manufacturedDoseForm'] = self.manufacturedDoseForm.as_json(*args)
      end
      unless self.unitOfPresentation.nil? 
        result['unitOfPresentation'] = self.unitOfPresentation.as_json(*args)
      end
      unless self.quantity.nil? 
        result['quantity'] = self.quantity.as_json(*args)
      end
      unless self.manufacturer.nil?  || !self.manufacturer.any? 
        result['manufacturer'] = self.manufacturer.map{ |x| x.as_json(*args) }
      end
      unless self.ingredient.nil?  || !self.ingredient.any? 
        result['ingredient'] = self.ingredient.map{ |x| x.as_json(*args) }
      end
      unless self.physicalCharacteristics.nil? 
        result['physicalCharacteristics'] = self.physicalCharacteristics.as_json(*args)
      end
      unless self.otherCharacteristics.nil?  || !self.otherCharacteristics.any? 
        result['otherCharacteristics'] = self.otherCharacteristics.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

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
