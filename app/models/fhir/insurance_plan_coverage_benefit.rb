module FHIR
  # fhir/insurance_plan_coverage_benefit.rb
  class InsurancePlanCoverageBenefit < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :requirement, class_name: 'FHIR::PrimitiveString'    
    embeds_many :limit, class_name: 'FHIR::InsurancePlanCoverageBenefitLimit'    
    
    def as_json(*args)
      result = super      
      unless self.type.nil? 
        result['type'] = self.type.as_json(*args)
      end
      unless self.requirement.nil? 
        result['requirement'] = self.requirement.value
        serialized = Extension.serializePrimitiveExtension(self.requirement)            
        result['_requirement'] = serialized unless serialized.nil?
      end
      unless self.limit.nil?  || !self.limit.any? 
        result['limit'] = self.limit.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = InsurancePlanCoverageBenefit.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['requirement'] = PrimitiveString.transform_json(json_hash['requirement'], json_hash['_requirement']) unless json_hash['requirement'].nil?
      result['limit'] = json_hash['limit'].map { |var| InsurancePlanCoverageBenefitLimit.transform_json(var) } unless json_hash['limit'].nil?

      result
    end
  end
end
