module FHIR
  # fhir/medicinal_product_packaged_package_item.rb
  class MedicinalProductPackagedPackageItem < BackboneElement
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :quantity, class_name: 'FHIR::Quantity'    
    embeds_many :material, class_name: 'FHIR::CodeableConcept'    
    embeds_many :alternateMaterial, class_name: 'FHIR::CodeableConcept'    
    embeds_many :device, class_name: 'FHIR::Reference'    
    embeds_many :manufacturedItem, class_name: 'FHIR::Reference'    
    embeds_many :packageItem, class_name: 'FHIR::MedicinalProductPackagedPackageItem'    
    embeds_one :physicalCharacteristics, class_name: 'FHIR::ProdCharacteristic'    
    embeds_many :otherCharacteristics, class_name: 'FHIR::CodeableConcept'    
    embeds_many :shelfLifeStorage, class_name: 'FHIR::ProductShelfLife'    
    embeds_many :manufacturer, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil?  || !self.identifier.any? 
        result['identifier'] = self.identifier.map{ |x| x.as_json(*args) }
      end
      unless self.type.nil? 
        result['type'] = self.type.as_json(*args)
      end
      unless self.quantity.nil? 
        result['quantity'] = self.quantity.as_json(*args)
      end
      unless self.material.nil?  || !self.material.any? 
        result['material'] = self.material.map{ |x| x.as_json(*args) }
      end
      unless self.alternateMaterial.nil?  || !self.alternateMaterial.any? 
        result['alternateMaterial'] = self.alternateMaterial.map{ |x| x.as_json(*args) }
      end
      unless self.device.nil?  || !self.device.any? 
        result['device'] = self.device.map{ |x| x.as_json(*args) }
      end
      unless self.manufacturedItem.nil?  || !self.manufacturedItem.any? 
        result['manufacturedItem'] = self.manufacturedItem.map{ |x| x.as_json(*args) }
      end
      unless self.packageItem.nil?  || !self.packageItem.any? 
        result['packageItem'] = self.packageItem.map{ |x| x.as_json(*args) }
      end
      unless self.physicalCharacteristics.nil? 
        result['physicalCharacteristics'] = self.physicalCharacteristics.as_json(*args)
      end
      unless self.otherCharacteristics.nil?  || !self.otherCharacteristics.any? 
        result['otherCharacteristics'] = self.otherCharacteristics.map{ |x| x.as_json(*args) }
      end
      unless self.shelfLifeStorage.nil?  || !self.shelfLifeStorage.any? 
        result['shelfLifeStorage'] = self.shelfLifeStorage.map{ |x| x.as_json(*args) }
      end
      unless self.manufacturer.nil?  || !self.manufacturer.any? 
        result['manufacturer'] = self.manufacturer.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

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
