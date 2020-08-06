module FHIR
  # fhir/procedure_focal_device.rb
  class ProcedureFocalDevice < BackboneElement
    include Mongoid::Document
    embeds_one :action, class_name: 'FHIR::CodeableConcept'    
    embeds_one :manipulated, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.action.nil? 
        result['action'] = self.action.as_json(*args)
      end
      unless self.manipulated.nil? 
        result['manipulated'] = self.manipulated.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ProcedureFocalDevice.new)
      result = self.superclass.transform_json(json_hash, target)
      result['action'] = CodeableConcept.transform_json(json_hash['action']) unless json_hash['action'].nil?
      result['manipulated'] = Reference.transform_json(json_hash['manipulated']) unless json_hash['manipulated'].nil?

      result
    end
  end
end
