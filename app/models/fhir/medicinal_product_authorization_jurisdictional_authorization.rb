module FHIR
  # fhir/medicinal_product_authorization_jurisdictional_authorization.rb
  class MedicinalProductAuthorizationJurisdictionalAuthorization < BackboneElement
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :country, class_name: 'FHIR::CodeableConcept'    
    embeds_many :jurisdiction, class_name: 'FHIR::CodeableConcept'    
    embeds_one :legalStatusOfSupply, class_name: 'FHIR::CodeableConcept'    
    embeds_one :validityPeriod, class_name: 'FHIR::Period'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil?  || !self.identifier.any? 
        result['identifier'] = self.identifier.map{ |x| x.as_json(*args) }
      end
      unless self.country.nil? 
        result['country'] = self.country.as_json(*args)
      end
      unless self.jurisdiction.nil?  || !self.jurisdiction.any? 
        result['jurisdiction'] = self.jurisdiction.map{ |x| x.as_json(*args) }
      end
      unless self.legalStatusOfSupply.nil? 
        result['legalStatusOfSupply'] = self.legalStatusOfSupply.as_json(*args)
      end
      unless self.validityPeriod.nil? 
        result['validityPeriod'] = self.validityPeriod.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = MedicinalProductAuthorizationJurisdictionalAuthorization.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Identifier.transform_json(var) 
        end
      } unless json_hash['identifier'].nil?
      result['country'] = CodeableConcept.transform_json(json_hash['country']) unless json_hash['country'].nil?
      result['jurisdiction'] = json_hash['jurisdiction'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['jurisdiction'].nil?
      result['legalStatusOfSupply'] = CodeableConcept.transform_json(json_hash['legalStatusOfSupply']) unless json_hash['legalStatusOfSupply'].nil?
      result['validityPeriod'] = Period.transform_json(json_hash['validityPeriod']) unless json_hash['validityPeriod'].nil?

      result
    end
  end
end
