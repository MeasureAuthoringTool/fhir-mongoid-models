module FHIR
  # fhir/consent_provision_actor.rb
  class ConsentProvisionActor < BackboneElement
    include Mongoid::Document
    embeds_one :role, class_name: 'FHIR::CodeableConcept'    
    embeds_one :reference, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.role.nil? 
        result['role'] = self.role.as_json(*args)
      end
      unless self.reference.nil? 
        result['reference'] = self.reference.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ConsentProvisionActor.new)
      result = self.superclass.transform_json(json_hash, target)
      result['role'] = CodeableConcept.transform_json(json_hash['role']) unless json_hash['role'].nil?
      result['reference'] = Reference.transform_json(json_hash['reference']) unless json_hash['reference'].nil?

      result
    end
  end
end
