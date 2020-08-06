module FHIR
  # fhir/coverage_eligibility_request_item.rb
  class CoverageEligibilityRequestItem < BackboneElement
    include Mongoid::Document
    embeds_many :supportingInfoSequence, class_name: 'FHIR::PrimitivePositiveInt'    
    embeds_one :category, class_name: 'FHIR::CodeableConcept'    
    embeds_one :productOrService, class_name: 'FHIR::CodeableConcept'    
    embeds_many :modifier, class_name: 'FHIR::CodeableConcept'    
    embeds_one :provider, class_name: 'FHIR::Reference'    
    embeds_one :quantity, class_name: 'FHIR::SimpleQuantity'    
    embeds_one :unitPrice, class_name: 'FHIR::Money'    
    embeds_one :facility, class_name: 'FHIR::Reference'    
    embeds_many :diagnosis, class_name: 'FHIR::CoverageEligibilityRequestItemDiagnosis'    
    embeds_many :detail, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.supportingInfoSequence.nil?  || !self.supportingInfoSequence.any? 
        result['supportingInfoSequence'] = self.supportingInfoSequence.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.supportingInfoSequence)                              
        result['_supportingInfoSequence'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.category.nil? 
        result['category'] = self.category.as_json(*args)
      end
      unless self.productOrService.nil? 
        result['productOrService'] = self.productOrService.as_json(*args)
      end
      unless self.modifier.nil?  || !self.modifier.any? 
        result['modifier'] = self.modifier.map{ |x| x.as_json(*args) }
      end
      unless self.provider.nil? 
        result['provider'] = self.provider.as_json(*args)
      end
      unless self.quantity.nil? 
        result['quantity'] = self.quantity.as_json(*args)
      end
      unless self.unitPrice.nil? 
        result['unitPrice'] = self.unitPrice.as_json(*args)
      end
      unless self.facility.nil? 
        result['facility'] = self.facility.as_json(*args)
      end
      unless self.diagnosis.nil?  || !self.diagnosis.any? 
        result['diagnosis'] = self.diagnosis.map{ |x| x.as_json(*args) }
      end
      unless self.detail.nil?  || !self.detail.any? 
        result['detail'] = self.detail.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = CoverageEligibilityRequestItem.new)
      result = self.superclass.transform_json(json_hash, target)
      result['supportingInfoSequence'] = json_hash['supportingInfoSequence'].each_with_index.map do |var, i|
        extension_hash = json_hash['_supportingInfoSequence'] && json_hash['_supportingInfoSequence'][i]
        PrimitivePositiveInt.transform_json(var, extension_hash)
      end unless json_hash['supportingInfoSequence'].nil?
      result['category'] = CodeableConcept.transform_json(json_hash['category']) unless json_hash['category'].nil?
      result['productOrService'] = CodeableConcept.transform_json(json_hash['productOrService']) unless json_hash['productOrService'].nil?
      result['modifier'] = json_hash['modifier'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['modifier'].nil?
      result['provider'] = Reference.transform_json(json_hash['provider']) unless json_hash['provider'].nil?
      result['quantity'] = SimpleQuantity.transform_json(json_hash['quantity']) unless json_hash['quantity'].nil?
      result['unitPrice'] = Money.transform_json(json_hash['unitPrice']) unless json_hash['unitPrice'].nil?
      result['facility'] = Reference.transform_json(json_hash['facility']) unless json_hash['facility'].nil?
      result['diagnosis'] = json_hash['diagnosis'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CoverageEligibilityRequestItemDiagnosis.transform_json(var) 
        end
      } unless json_hash['diagnosis'].nil?
      result['detail'] = json_hash['detail'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['detail'].nil?

      result
    end
  end
end
