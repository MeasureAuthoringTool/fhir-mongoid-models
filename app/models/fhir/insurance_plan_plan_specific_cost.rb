module FHIR
  # fhir/insurance_plan_plan_specific_cost.rb
  class InsurancePlanPlanSpecificCost < BackboneElement
    include Mongoid::Document
    embeds_one :category, class_name: 'FHIR::CodeableConcept'    
    embeds_many :benefit, class_name: 'FHIR::InsurancePlanPlanSpecificCostBenefit'    
    
    def as_json(*args)
      result = super      
      unless self.category.nil? 
        result['category'] = self.category.as_json(*args)
      end
      unless self.benefit.nil?  || !self.benefit.any? 
        result['benefit'] = self.benefit.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = InsurancePlanPlanSpecificCost.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['category'] = CodeableConcept.transform_json(json_hash['category']) unless json_hash['category'].nil?
      result['benefit'] = json_hash['benefit'].map { |var| InsurancePlanPlanSpecificCostBenefit.transform_json(var) } unless json_hash['benefit'].nil?

      result
    end
  end
end
