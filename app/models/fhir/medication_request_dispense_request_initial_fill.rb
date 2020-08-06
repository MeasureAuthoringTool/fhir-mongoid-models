module FHIR
  # fhir/medication_request_dispense_request_initial_fill.rb
  class MedicationRequestDispenseRequestInitialFill < BackboneElement
    include Mongoid::Document
    embeds_one :quantity, class_name: 'FHIR::SimpleQuantity'    
    embeds_one :duration, class_name: 'FHIR::Duration'    
    
    def as_json(*args)
      result = super      
      unless self.quantity.nil? 
        result['quantity'] = self.quantity.as_json(*args)
      end
      unless self.duration.nil? 
        result['duration'] = self.duration.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = MedicationRequestDispenseRequestInitialFill.new)
      result = self.superclass.transform_json(json_hash, target)
      result['quantity'] = SimpleQuantity.transform_json(json_hash['quantity']) unless json_hash['quantity'].nil?
      result['duration'] = Duration.transform_json(json_hash['duration']) unless json_hash['duration'].nil?

      result
    end
  end
end
