module FHIR
  # fhir/device_property.rb
  class DeviceProperty < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_many :valueQuantity, class_name: 'FHIR::Quantity'    
    embeds_many :valueCode, class_name: 'FHIR::CodeableConcept'    
    
    def as_json(*args)
      result = super      
      unless self.type.nil? 
        result['type'] = self.type.as_json(*args)
      end
      unless self.valueQuantity.nil?  || !self.valueQuantity.any? 
        result['valueQuantity'] = self.valueQuantity.map{ |x| x.as_json(*args) }
      end
      unless self.valueCode.nil?  || !self.valueCode.any? 
        result['valueCode'] = self.valueCode.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = DeviceProperty.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['valueQuantity'] = json_hash['valueQuantity'].map { |var| Quantity.transform_json(var) } unless json_hash['valueQuantity'].nil?
      result['valueCode'] = json_hash['valueCode'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['valueCode'].nil?

      result
    end
  end
end
