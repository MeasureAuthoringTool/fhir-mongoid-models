module FHIR
  # fhir/plan_definition_goal_target.rb
  class PlanDefinitionGoalTarget < BackboneElement
    include Mongoid::Document
    embeds_one :measure, class_name: 'FHIR::CodeableConcept'    
    embeds_one :detailQuantity, class_name: 'FHIR::Quantity'    
    embeds_one :detailRange, class_name: 'FHIR::Range'    
    embeds_one :detailCodeableConcept, class_name: 'FHIR::CodeableConcept'    
    embeds_one :due, class_name: 'FHIR::Duration'    
    
    def as_json(*args)
      result = super      
      unless self.measure.nil? 
        result['measure'] = self.measure.as_json(*args)
      end
      unless self.detailQuantity.nil?
        result['detailQuantity'] = self.detailQuantity.as_json(*args)                        
      end          
      unless self.detailRange.nil?
        result['detailRange'] = self.detailRange.as_json(*args)                        
      end          
      unless self.detailCodeableConcept.nil?
        result['detailCodeableConcept'] = self.detailCodeableConcept.as_json(*args)                        
      end          
      unless self.due.nil? 
        result['due'] = self.due.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = PlanDefinitionGoalTarget.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['measure'] = CodeableConcept.transform_json(json_hash['measure']) unless json_hash['measure'].nil?
      result['detailQuantity'] = Quantity.transform_json(json_hash['detailQuantity']) unless json_hash['detailQuantity'].nil?
      result['detailRange'] = Range.transform_json(json_hash['detailRange']) unless json_hash['detailRange'].nil?
      result['detailCodeableConcept'] = CodeableConcept.transform_json(json_hash['detailCodeableConcept']) unless json_hash['detailCodeableConcept'].nil?
      result['due'] = Duration.transform_json(json_hash['due']) unless json_hash['due'].nil?

      result
    end
  end
end
