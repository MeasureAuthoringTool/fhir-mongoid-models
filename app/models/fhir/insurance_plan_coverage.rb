module FHIR
  # fhir/insurance_plan_coverage.rb
  class InsurancePlanCoverage < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_many :network, class_name: 'FHIR::Reference'    
    embeds_many :benefit, class_name: 'FHIR::InsurancePlanCoverageBenefit'    
    
    def as_json(*args)
      result = super      
      unless self.type.nil? 
        result['type'] = self.type.as_json(*args)
      end
      unless self.network.nil?  || !self.network.any? 
        result['network'] = self.network.map{ |x| x.as_json(*args) }
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

    def self.transform_json(json_hash, target = InsurancePlanCoverage.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['network'] = json_hash['network'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['network'].nil?
      result['benefit'] = json_hash['benefit'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          InsurancePlanCoverageBenefit.transform_json(var) 
        end
      } unless json_hash['benefit'].nil?

      result
    end
  end
end
