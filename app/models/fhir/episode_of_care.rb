module FHIR
  # fhir/episode_of_care.rb
  class EpisodeOfCare < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :status, class_name: 'FHIR::EpisodeOfCareStatus'    
    embeds_many :statusHistory, class_name: 'FHIR::EpisodeOfCareStatusHistory'    
    embeds_many :type, class_name: 'FHIR::CodeableConcept'    
    embeds_many :diagnosis, class_name: 'FHIR::EpisodeOfCareDiagnosis'    
    embeds_one :patient, class_name: 'FHIR::Reference'    
    embeds_one :managingOrganization, class_name: 'FHIR::Reference'    
    embeds_one :period, class_name: 'FHIR::Period'    
    embeds_many :referralRequest, class_name: 'FHIR::Reference'    
    embeds_one :careManager, class_name: 'FHIR::Reference'    
    embeds_many :team, class_name: 'FHIR::Reference'    
    embeds_many :account, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil?  || !self.identifier.any? 
        result['identifier'] = self.identifier.map{ |x| x.as_json(*args) }
      end
      unless self.status.nil? 
        result['status'] = self.status.value
        serialized = Extension.serializePrimitiveExtension(self.status)            
        result['_status'] = serialized unless serialized.nil?
      end
      unless self.statusHistory.nil?  || !self.statusHistory.any? 
        result['statusHistory'] = self.statusHistory.map{ |x| x.as_json(*args) }
      end
      unless self.type.nil?  || !self.type.any? 
        result['type'] = self.type.map{ |x| x.as_json(*args) }
      end
      unless self.diagnosis.nil?  || !self.diagnosis.any? 
        result['diagnosis'] = self.diagnosis.map{ |x| x.as_json(*args) }
      end
      unless self.patient.nil? 
        result['patient'] = self.patient.as_json(*args)
      end
      unless self.managingOrganization.nil? 
        result['managingOrganization'] = self.managingOrganization.as_json(*args)
      end
      unless self.period.nil? 
        result['period'] = self.period.as_json(*args)
      end
      unless self.referralRequest.nil?  || !self.referralRequest.any? 
        result['referralRequest'] = self.referralRequest.map{ |x| x.as_json(*args) }
      end
      unless self.careManager.nil? 
        result['careManager'] = self.careManager.as_json(*args)
      end
      unless self.team.nil?  || !self.team.any? 
        result['team'] = self.team.map{ |x| x.as_json(*args) }
      end
      unless self.account.nil?  || !self.account.any? 
        result['account'] = self.account.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = EpisodeOfCare.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Identifier.transform_json(var) 
        end
      } unless json_hash['identifier'].nil?
      result['status'] = EpisodeOfCareStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['statusHistory'] = json_hash['statusHistory'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          EpisodeOfCareStatusHistory.transform_json(var) 
        end
      } unless json_hash['statusHistory'].nil?
      result['type'] = json_hash['type'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['type'].nil?
      result['diagnosis'] = json_hash['diagnosis'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          EpisodeOfCareDiagnosis.transform_json(var) 
        end
      } unless json_hash['diagnosis'].nil?
      result['patient'] = Reference.transform_json(json_hash['patient']) unless json_hash['patient'].nil?
      result['managingOrganization'] = Reference.transform_json(json_hash['managingOrganization']) unless json_hash['managingOrganization'].nil?
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?
      result['referralRequest'] = json_hash['referralRequest'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['referralRequest'].nil?
      result['careManager'] = Reference.transform_json(json_hash['careManager']) unless json_hash['careManager'].nil?
      result['team'] = json_hash['team'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['team'].nil?
      result['account'] = json_hash['account'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['account'].nil?

      result
    end
  end
end
