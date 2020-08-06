module FHIR
  # fhir/coverage_cost_to_beneficiary.rb
  class CoverageCostToBeneficiary < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :valueSimpleQuantity, class_name: 'FHIR::SimpleQuantity'    
    embeds_one :valueMoney, class_name: 'FHIR::Money'    
    embeds_many :exception, class_name: 'FHIR::CoverageCostToBeneficiaryException'    
    
    def as_json(*args)
      result = super      
      unless self.type.nil? 
        result['type'] = self.type.as_json(*args)
      end
      unless self.valueSimpleQuantity.nil?
        result['valueSimpleQuantity'] = self.valueSimpleQuantity.as_json(*args)                        
      end          
      unless self.valueMoney.nil?
        result['valueMoney'] = self.valueMoney.as_json(*args)                        
      end          
      unless self.exception.nil?  || !self.exception.any? 
        result['exception'] = self.exception.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = CoverageCostToBeneficiary.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['valueSimpleQuantity'] = SimpleQuantity.transform_json(json_hash['valueSimpleQuantity']) unless json_hash['valueSimpleQuantity'].nil?
      result['valueMoney'] = Money.transform_json(json_hash['valueMoney']) unless json_hash['valueMoney'].nil?
      result['exception'] = json_hash['exception'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CoverageCostToBeneficiaryException.transform_json(var) 
        end
      } unless json_hash['exception'].nil?

      result
    end
  end
end
