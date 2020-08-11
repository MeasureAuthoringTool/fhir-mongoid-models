module FHIR
  # fhir/insurance_plan_plan_specific_cost_benefit_cost.rb
  class InsurancePlanPlanSpecificCostBenefitCost < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :applicability, class_name: 'FHIR::CodeableConcept'    
    embeds_many :qualifiers, class_name: 'FHIR::CodeableConcept'    
    embeds_one :value, class_name: 'FHIR::Quantity'    
    
    def as_json(*args)
      result = super      
      unless self.type.nil? 
        result['type'] = self.type.as_json(*args)
      end
      unless self.applicability.nil? 
        result['applicability'] = self.applicability.as_json(*args)
      end
      unless self.qualifiers.nil?  || !self.qualifiers.any? 
        result['qualifiers'] = self.qualifiers.map{ |x| x.as_json(*args) }
      end
      unless self.value.nil? 
        result['value'] = self.value.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = InsurancePlanPlanSpecificCostBenefitCost.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['applicability'] = CodeableConcept.transform_json(json_hash['applicability']) unless json_hash['applicability'].nil?
      result['qualifiers'] = json_hash['qualifiers'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['qualifiers'].nil?
      result['value'] = Quantity.transform_json(json_hash['value']) unless json_hash['value'].nil?

      result
    end
  end
end
