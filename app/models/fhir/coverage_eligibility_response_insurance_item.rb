module FHIR
  # fhir/coverage_eligibility_response_insurance_item.rb
  class CoverageEligibilityResponseInsuranceItem < BackboneElement
    include Mongoid::Document
    embeds_one :category, class_name: 'FHIR::CodeableConcept'    
    embeds_one :productOrService, class_name: 'FHIR::CodeableConcept'    
    embeds_many :modifier, class_name: 'FHIR::CodeableConcept'    
    embeds_one :provider, class_name: 'FHIR::Reference'    
    embeds_one :excluded, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :name, class_name: 'FHIR::PrimitiveString'    
    embeds_one :description, class_name: 'FHIR::PrimitiveString'    
    embeds_one :network, class_name: 'FHIR::CodeableConcept'    
    embeds_one :unit, class_name: 'FHIR::CodeableConcept'    
    embeds_one :term, class_name: 'FHIR::CodeableConcept'    
    embeds_many :benefit, class_name: 'FHIR::CoverageEligibilityResponseInsuranceItemBenefit'    
    embeds_one :authorizationRequired, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_many :authorizationSupporting, class_name: 'FHIR::CodeableConcept'    
    embeds_one :authorizationUrl, class_name: 'FHIR::PrimitiveUri'    
    
    def as_json(*args)
      result = super      
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
      unless self.excluded.nil? 
        result['excluded'] = self.excluded.value
        serialized = Extension.serializePrimitiveExtension(self.excluded)            
        result['_excluded'] = serialized unless serialized.nil?
      end
      unless self.name.nil? 
        result['name'] = self.name.value
        serialized = Extension.serializePrimitiveExtension(self.name)            
        result['_name'] = serialized unless serialized.nil?
      end
      unless self.description.nil? 
        result['description'] = self.description.value
        serialized = Extension.serializePrimitiveExtension(self.description)            
        result['_description'] = serialized unless serialized.nil?
      end
      unless self.network.nil? 
        result['network'] = self.network.as_json(*args)
      end
      unless self.unit.nil? 
        result['unit'] = self.unit.as_json(*args)
      end
      unless self.term.nil? 
        result['term'] = self.term.as_json(*args)
      end
      unless self.benefit.nil?  || !self.benefit.any? 
        result['benefit'] = self.benefit.map{ |x| x.as_json(*args) }
      end
      unless self.authorizationRequired.nil? 
        result['authorizationRequired'] = self.authorizationRequired.value
        serialized = Extension.serializePrimitiveExtension(self.authorizationRequired)            
        result['_authorizationRequired'] = serialized unless serialized.nil?
      end
      unless self.authorizationSupporting.nil?  || !self.authorizationSupporting.any? 
        result['authorizationSupporting'] = self.authorizationSupporting.map{ |x| x.as_json(*args) }
      end
      unless self.authorizationUrl.nil? 
        result['authorizationUrl'] = self.authorizationUrl.value
        serialized = Extension.serializePrimitiveExtension(self.authorizationUrl)            
        result['_authorizationUrl'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = CoverageEligibilityResponseInsuranceItem.new)
      result = self.superclass.transform_json(json_hash, target)
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
      result['excluded'] = PrimitiveBoolean.transform_json(json_hash['excluded'], json_hash['_excluded']) unless json_hash['excluded'].nil?
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['network'] = CodeableConcept.transform_json(json_hash['network']) unless json_hash['network'].nil?
      result['unit'] = CodeableConcept.transform_json(json_hash['unit']) unless json_hash['unit'].nil?
      result['term'] = CodeableConcept.transform_json(json_hash['term']) unless json_hash['term'].nil?
      result['benefit'] = json_hash['benefit'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CoverageEligibilityResponseInsuranceItemBenefit.transform_json(var) 
        end
      } unless json_hash['benefit'].nil?
      result['authorizationRequired'] = PrimitiveBoolean.transform_json(json_hash['authorizationRequired'], json_hash['_authorizationRequired']) unless json_hash['authorizationRequired'].nil?
      result['authorizationSupporting'] = json_hash['authorizationSupporting'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['authorizationSupporting'].nil?
      result['authorizationUrl'] = PrimitiveUri.transform_json(json_hash['authorizationUrl'], json_hash['_authorizationUrl']) unless json_hash['authorizationUrl'].nil?

      result
    end
  end
end
