module FHIR
  # fhir/medication_request_dispense_request.rb
  class MedicationRequestDispenseRequest < BackboneElement
    include Mongoid::Document
    embeds_one :initialFill, class_name: 'FHIR::MedicationRequestDispenseRequestInitialFill'    
    embeds_one :dispenseInterval, class_name: 'FHIR::Duration'    
    embeds_one :validityPeriod, class_name: 'FHIR::Period'    
    embeds_one :numberOfRepeatsAllowed, class_name: 'FHIR::PrimitiveUnsignedInt'    
    embeds_one :quantity, class_name: 'FHIR::SimpleQuantity'    
    embeds_one :expectedSupplyDuration, class_name: 'FHIR::Duration'    
    embeds_one :performer, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.initialFill.nil? 
        result['initialFill'] = self.initialFill.as_json(*args)
      end
      unless self.dispenseInterval.nil? 
        result['dispenseInterval'] = self.dispenseInterval.as_json(*args)
      end
      unless self.validityPeriod.nil? 
        result['validityPeriod'] = self.validityPeriod.as_json(*args)
      end
      unless self.numberOfRepeatsAllowed.nil? 
        result['numberOfRepeatsAllowed'] = self.numberOfRepeatsAllowed.value
        serialized = Extension.serializePrimitiveExtension(self.numberOfRepeatsAllowed)            
        result['_numberOfRepeatsAllowed'] = serialized unless serialized.nil?
      end
      unless self.quantity.nil? 
        result['quantity'] = self.quantity.as_json(*args)
      end
      unless self.expectedSupplyDuration.nil? 
        result['expectedSupplyDuration'] = self.expectedSupplyDuration.as_json(*args)
      end
      unless self.performer.nil? 
        result['performer'] = self.performer.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = MedicationRequestDispenseRequest.new)
      result = self.superclass.transform_json(json_hash, target)
      result['initialFill'] = MedicationRequestDispenseRequestInitialFill.transform_json(json_hash['initialFill']) unless json_hash['initialFill'].nil?
      result['dispenseInterval'] = Duration.transform_json(json_hash['dispenseInterval']) unless json_hash['dispenseInterval'].nil?
      result['validityPeriod'] = Period.transform_json(json_hash['validityPeriod']) unless json_hash['validityPeriod'].nil?
      result['numberOfRepeatsAllowed'] = PrimitiveUnsignedInt.transform_json(json_hash['numberOfRepeatsAllowed'], json_hash['_numberOfRepeatsAllowed']) unless json_hash['numberOfRepeatsAllowed'].nil?
      result['quantity'] = SimpleQuantity.transform_json(json_hash['quantity']) unless json_hash['quantity'].nil?
      result['expectedSupplyDuration'] = Duration.transform_json(json_hash['expectedSupplyDuration']) unless json_hash['expectedSupplyDuration'].nil?
      result['performer'] = Reference.transform_json(json_hash['performer']) unless json_hash['performer'].nil?

      result
    end
  end
end
