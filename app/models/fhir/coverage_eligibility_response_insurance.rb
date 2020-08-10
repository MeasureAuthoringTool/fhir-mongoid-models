module FHIR
  # fhir/coverage_eligibility_response_insurance.rb
  class CoverageEligibilityResponseInsurance < BackboneElement
    include Mongoid::Document
    embeds_one :coverage, class_name: 'FHIR::Reference'    
    embeds_one :inforce, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :benefitPeriod, class_name: 'FHIR::Period'    
    embeds_many :item, class_name: 'FHIR::CoverageEligibilityResponseInsuranceItem'    
    
    def as_json(*args)
      result = super      
      unless self.coverage.nil? 
        result['coverage'] = self.coverage.as_json(*args)
      end
      unless self.inforce.nil? 
        result['inforce'] = self.inforce.value
        serialized = Extension.serializePrimitiveExtension(self.inforce)            
        result['_inforce'] = serialized unless serialized.nil?
      end
      unless self.benefitPeriod.nil? 
        result['benefitPeriod'] = self.benefitPeriod.as_json(*args)
      end
      unless self.item.nil?  || !self.item.any? 
        result['item'] = self.item.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = CoverageEligibilityResponseInsurance.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['coverage'] = Reference.transform_json(json_hash['coverage']) unless json_hash['coverage'].nil?
      result['inforce'] = PrimitiveBoolean.transform_json(json_hash['inforce'], json_hash['_inforce']) unless json_hash['inforce'].nil?
      result['benefitPeriod'] = Period.transform_json(json_hash['benefitPeriod']) unless json_hash['benefitPeriod'].nil?
      result['item'] = json_hash['item'].map { |var| CoverageEligibilityResponseInsuranceItem.transform_json(var) } unless json_hash['item'].nil?

      result
    end
  end
end
