module FHIR
  # fhir/provenance_agent.rb
  class ProvenanceAgent < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_many :role, class_name: 'FHIR::CodeableConcept'    
    embeds_one :who, class_name: 'FHIR::Reference'    
    embeds_one :onBehalfOf, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.type.nil? 
        result['type'] = self.type.as_json(*args)
      end
      unless self.role.nil?  || !self.role.any? 
        result['role'] = self.role.map{ |x| x.as_json(*args) }
      end
      unless self.who.nil? 
        result['who'] = self.who.as_json(*args)
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

    def self.transform_json(json_hash, target = ProvenanceAgent.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['role'] = json_hash['role'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['role'].nil?
      result['who'] = Reference.transform_json(json_hash['who']) unless json_hash['who'].nil?
      result['onBehalfOf'] = Reference.transform_json(json_hash['onBehalfOf']) unless json_hash['onBehalfOf'].nil?

      result
    end
  end
end
