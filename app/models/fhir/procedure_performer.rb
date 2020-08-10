module FHIR
  # fhir/procedure_performer.rb
  class ProcedurePerformer < BackboneElement
    include Mongoid::Document
    embeds_one :function, class_name: 'FHIR::CodeableConcept'    
    embeds_one :actor, class_name: 'FHIR::Reference'    
    embeds_one :onBehalfOf, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.function.nil? 
        result['function'] = self.function.as_json(*args)
      end
      unless self.actor.nil? 
        result['actor'] = self.actor.as_json(*args)
      end
      unless self.onBehalfOf.nil? 
        result['onBehalfOf'] = self.onBehalfOf.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ProcedurePerformer.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['function'] = CodeableConcept.transform_json(json_hash['function']) unless json_hash['function'].nil?
      result['actor'] = Reference.transform_json(json_hash['actor']) unless json_hash['actor'].nil?
      result['onBehalfOf'] = Reference.transform_json(json_hash['onBehalfOf']) unless json_hash['onBehalfOf'].nil?

      result
    end
  end
end
