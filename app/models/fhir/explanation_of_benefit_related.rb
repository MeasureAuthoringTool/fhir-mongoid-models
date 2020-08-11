module FHIR
  # fhir/explanation_of_benefit_related.rb
  class ExplanationOfBenefitRelated < BackboneElement
    include Mongoid::Document
    embeds_one :claim, class_name: 'FHIR::Reference'    
    embeds_one :relationship, class_name: 'FHIR::CodeableConcept'    
    embeds_one :reference, class_name: 'FHIR::Identifier'    
    
    def as_json(*args)
      result = super      
      unless self.claim.nil? 
        result['claim'] = self.claim.as_json(*args)
      end
      unless self.relationship.nil? 
        result['relationship'] = self.relationship.as_json(*args)
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

    def self.transform_json(json_hash, target = ExplanationOfBenefitRelated.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['claim'] = Reference.transform_json(json_hash['claim']) unless json_hash['claim'].nil?
      result['relationship'] = CodeableConcept.transform_json(json_hash['relationship']) unless json_hash['relationship'].nil?
      result['reference'] = Identifier.transform_json(json_hash['reference']) unless json_hash['reference'].nil?

      result
    end
  end
end
