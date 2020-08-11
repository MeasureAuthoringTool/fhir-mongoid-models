module FHIR
  # fhir/invoice_participant.rb
  class InvoiceParticipant < BackboneElement
    include Mongoid::Document
    embeds_one :role, class_name: 'FHIR::CodeableConcept'    
    embeds_one :actor, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.role.nil? 
        result['role'] = self.role.as_json(*args)
      end
      unless self.actor.nil? 
        result['actor'] = self.actor.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = InvoiceParticipant.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['role'] = CodeableConcept.transform_json(json_hash['role']) unless json_hash['role'].nil?
      result['actor'] = Reference.transform_json(json_hash['actor']) unless json_hash['actor'].nil?

      result
    end
  end
end
