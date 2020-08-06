module FHIR
  # fhir/organization_affiliation.rb
  class OrganizationAffiliation < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :active, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :period, class_name: 'FHIR::Period'    
    embeds_one :organization, class_name: 'FHIR::Reference'    
    embeds_one :participatingOrganization, class_name: 'FHIR::Reference'    
    embeds_many :network, class_name: 'FHIR::Reference'    
    embeds_many :code, class_name: 'FHIR::CodeableConcept'    
    embeds_many :specialty, class_name: 'FHIR::CodeableConcept'    
    embeds_many :location, class_name: 'FHIR::Reference'    
    embeds_many :healthcareService, class_name: 'FHIR::Reference'    
    embeds_many :telecom, class_name: 'FHIR::ContactPoint'    
    embeds_many :endpoint, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil?  || !self.identifier.any? 
        result['identifier'] = self.identifier.map{ |x| x.as_json(*args) }
      end
      unless self.active.nil? 
        result['active'] = self.active.value
        serialized = Extension.serializePrimitiveExtension(self.active)            
        result['_active'] = serialized unless serialized.nil?
      end
      unless self.period.nil? 
        result['period'] = self.period.as_json(*args)
      end
      unless self.organization.nil? 
        result['organization'] = self.organization.as_json(*args)
      end
      unless self.participatingOrganization.nil? 
        result['participatingOrganization'] = self.participatingOrganization.as_json(*args)
      end
      unless self.network.nil?  || !self.network.any? 
        result['network'] = self.network.map{ |x| x.as_json(*args) }
      end
      unless self.code.nil?  || !self.code.any? 
        result['code'] = self.code.map{ |x| x.as_json(*args) }
      end
      unless self.specialty.nil?  || !self.specialty.any? 
        result['specialty'] = self.specialty.map{ |x| x.as_json(*args) }
      end
      unless self.location.nil?  || !self.location.any? 
        result['location'] = self.location.map{ |x| x.as_json(*args) }
      end
      unless self.healthcareService.nil?  || !self.healthcareService.any? 
        result['healthcareService'] = self.healthcareService.map{ |x| x.as_json(*args) }
      end
      unless self.telecom.nil?  || !self.telecom.any? 
        result['telecom'] = self.telecom.map{ |x| x.as_json(*args) }
      end
      unless self.endpoint.nil?  || !self.endpoint.any? 
        result['endpoint'] = self.endpoint.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = OrganizationAffiliation.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Identifier.transform_json(var) 
        end
      } unless json_hash['identifier'].nil?
      result['active'] = PrimitiveBoolean.transform_json(json_hash['active'], json_hash['_active']) unless json_hash['active'].nil?
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?
      result['organization'] = Reference.transform_json(json_hash['organization']) unless json_hash['organization'].nil?
      result['participatingOrganization'] = Reference.transform_json(json_hash['participatingOrganization']) unless json_hash['participatingOrganization'].nil?
      result['network'] = json_hash['network'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['network'].nil?
      result['code'] = json_hash['code'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['code'].nil?
      result['specialty'] = json_hash['specialty'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['specialty'].nil?
      result['location'] = json_hash['location'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['location'].nil?
      result['healthcareService'] = json_hash['healthcareService'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['healthcareService'].nil?
      result['telecom'] = json_hash['telecom'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          ContactPoint.transform_json(var) 
        end
      } unless json_hash['telecom'].nil?
      result['endpoint'] = json_hash['endpoint'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['endpoint'].nil?

      result
    end
  end
end
