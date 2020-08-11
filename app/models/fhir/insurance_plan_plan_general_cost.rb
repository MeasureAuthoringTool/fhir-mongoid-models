module FHIR
  # fhir/insurance_plan_plan_general_cost.rb
  class InsurancePlanPlanGeneralCost < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :groupSize, class_name: 'FHIR::PrimitivePositiveInt'    
    embeds_one :cost, class_name: 'FHIR::Money'    
    embeds_one :comment, class_name: 'FHIR::PrimitiveString'    
    
    def as_json(*args)
      result = super      
      unless self.type.nil? 
        result['type'] = self.type.as_json(*args)
      end
      unless self.groupSize.nil? 
        result['groupSize'] = self.groupSize.value
        serialized = Extension.serializePrimitiveExtension(self.groupSize)            
        result['_groupSize'] = serialized unless serialized.nil?
      end
      unless self.cost.nil? 
        result['cost'] = self.cost.as_json(*args)
      end
      unless self.comment.nil? 
        result['comment'] = self.comment.value
        serialized = Extension.serializePrimitiveExtension(self.comment)            
        result['_comment'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = InsurancePlanPlanGeneralCost.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['groupSize'] = PrimitivePositiveInt.transform_json(json_hash['groupSize'], json_hash['_groupSize']) unless json_hash['groupSize'].nil?
      result['cost'] = Money.transform_json(json_hash['cost']) unless json_hash['cost'].nil?
      result['comment'] = PrimitiveString.transform_json(json_hash['comment'], json_hash['_comment']) unless json_hash['comment'].nil?

      result
    end
  end
end
