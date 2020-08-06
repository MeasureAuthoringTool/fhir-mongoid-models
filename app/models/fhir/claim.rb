module FHIR
  # fhir/claim.rb
  class Claim < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :status, class_name: 'FHIR::ClaimStatus'    
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :subType, class_name: 'FHIR::CodeableConcept'    
    embeds_one :use, class_name: 'FHIR::Use'    
    embeds_one :patient, class_name: 'FHIR::Reference'    
    embeds_one :billablePeriod, class_name: 'FHIR::Period'    
    embeds_one :created, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :enterer, class_name: 'FHIR::Reference'    
    embeds_one :insurer, class_name: 'FHIR::Reference'    
    embeds_one :provider, class_name: 'FHIR::Reference'    
    embeds_one :priority, class_name: 'FHIR::CodeableConcept'    
    embeds_one :fundsReserve, class_name: 'FHIR::CodeableConcept'    
    embeds_many :related, class_name: 'FHIR::ClaimRelated'    
    embeds_one :prescription, class_name: 'FHIR::Reference'    
    embeds_one :originalPrescription, class_name: 'FHIR::Reference'    
    embeds_one :payee, class_name: 'FHIR::ClaimPayee'    
    embeds_one :referral, class_name: 'FHIR::Reference'    
    embeds_one :facility, class_name: 'FHIR::Reference'    
    embeds_many :careTeam, class_name: 'FHIR::ClaimCareTeam'    
    embeds_many :supportingInfo, class_name: 'FHIR::ClaimSupportingInfo'    
    embeds_many :diagnosis, class_name: 'FHIR::ClaimDiagnosis'    
    embeds_many :procedure, class_name: 'FHIR::ClaimProcedure'    
    embeds_many :insurance, class_name: 'FHIR::ClaimInsurance'    
    embeds_one :accident, class_name: 'FHIR::ClaimAccident'    
    embeds_many :item, class_name: 'FHIR::ClaimItem'    
    embeds_one :total, class_name: 'FHIR::Money'    
    
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
      unless self.type.nil? 
        result['type'] = self.type.as_json(*args)
      end
      unless self.subType.nil? 
        result['subType'] = self.subType.as_json(*args)
      end
      unless self.use.nil? 
        result['use'] = self.use.value
        serialized = Extension.serializePrimitiveExtension(self.use)            
        result['_use'] = serialized unless serialized.nil?
      end
      unless self.patient.nil? 
        result['patient'] = self.patient.as_json(*args)
      end
      unless self.billablePeriod.nil? 
        result['billablePeriod'] = self.billablePeriod.as_json(*args)
      end
      unless self.created.nil? 
        result['created'] = self.created.value
        serialized = Extension.serializePrimitiveExtension(self.created)            
        result['_created'] = serialized unless serialized.nil?
      end
      unless self.enterer.nil? 
        result['enterer'] = self.enterer.as_json(*args)
      end
      unless self.insurer.nil? 
        result['insurer'] = self.insurer.as_json(*args)
      end
      unless self.provider.nil? 
        result['provider'] = self.provider.as_json(*args)
      end
      unless self.priority.nil? 
        result['priority'] = self.priority.as_json(*args)
      end
      unless self.fundsReserve.nil? 
        result['fundsReserve'] = self.fundsReserve.as_json(*args)
      end
      unless self.related.nil?  || !self.related.any? 
        result['related'] = self.related.map{ |x| x.as_json(*args) }
      end
      unless self.prescription.nil? 
        result['prescription'] = self.prescription.as_json(*args)
      end
      unless self.originalPrescription.nil? 
        result['originalPrescription'] = self.originalPrescription.as_json(*args)
      end
      unless self.payee.nil? 
        result['payee'] = self.payee.as_json(*args)
      end
      unless self.referral.nil? 
        result['referral'] = self.referral.as_json(*args)
      end
      unless self.facility.nil? 
        result['facility'] = self.facility.as_json(*args)
      end
      unless self.careTeam.nil?  || !self.careTeam.any? 
        result['careTeam'] = self.careTeam.map{ |x| x.as_json(*args) }
      end
      unless self.supportingInfo.nil?  || !self.supportingInfo.any? 
        result['supportingInfo'] = self.supportingInfo.map{ |x| x.as_json(*args) }
      end
      unless self.diagnosis.nil?  || !self.diagnosis.any? 
        result['diagnosis'] = self.diagnosis.map{ |x| x.as_json(*args) }
      end
      unless self.procedure.nil?  || !self.procedure.any? 
        result['procedure'] = self.procedure.map{ |x| x.as_json(*args) }
      end
      unless self.insurance.nil?  || !self.insurance.any? 
        result['insurance'] = self.insurance.map{ |x| x.as_json(*args) }
      end
      unless self.accident.nil? 
        result['accident'] = self.accident.as_json(*args)
      end
      unless self.item.nil?  || !self.item.any? 
        result['item'] = self.item.map{ |x| x.as_json(*args) }
      end
      unless self.total.nil? 
        result['total'] = self.total.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = Claim.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Identifier.transform_json(var) 
        end
      } unless json_hash['identifier'].nil?
      result['status'] = ClaimStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['subType'] = CodeableConcept.transform_json(json_hash['subType']) unless json_hash['subType'].nil?
      result['use'] = Use.transform_json(json_hash['use'], json_hash['_use']) unless json_hash['use'].nil?
      result['patient'] = Reference.transform_json(json_hash['patient']) unless json_hash['patient'].nil?
      result['billablePeriod'] = Period.transform_json(json_hash['billablePeriod']) unless json_hash['billablePeriod'].nil?
      result['created'] = PrimitiveDateTime.transform_json(json_hash['created'], json_hash['_created']) unless json_hash['created'].nil?
      result['enterer'] = Reference.transform_json(json_hash['enterer']) unless json_hash['enterer'].nil?
      result['insurer'] = Reference.transform_json(json_hash['insurer']) unless json_hash['insurer'].nil?
      result['provider'] = Reference.transform_json(json_hash['provider']) unless json_hash['provider'].nil?
      result['priority'] = CodeableConcept.transform_json(json_hash['priority']) unless json_hash['priority'].nil?
      result['fundsReserve'] = CodeableConcept.transform_json(json_hash['fundsReserve']) unless json_hash['fundsReserve'].nil?
      result['related'] = json_hash['related'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          ClaimRelated.transform_json(var) 
        end
      } unless json_hash['related'].nil?
      result['prescription'] = Reference.transform_json(json_hash['prescription']) unless json_hash['prescription'].nil?
      result['originalPrescription'] = Reference.transform_json(json_hash['originalPrescription']) unless json_hash['originalPrescription'].nil?
      result['payee'] = ClaimPayee.transform_json(json_hash['payee']) unless json_hash['payee'].nil?
      result['referral'] = Reference.transform_json(json_hash['referral']) unless json_hash['referral'].nil?
      result['facility'] = Reference.transform_json(json_hash['facility']) unless json_hash['facility'].nil?
      result['careTeam'] = json_hash['careTeam'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          ClaimCareTeam.transform_json(var) 
        end
      } unless json_hash['careTeam'].nil?
      result['supportingInfo'] = json_hash['supportingInfo'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          ClaimSupportingInfo.transform_json(var) 
        end
      } unless json_hash['supportingInfo'].nil?
      result['diagnosis'] = json_hash['diagnosis'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          ClaimDiagnosis.transform_json(var) 
        end
      } unless json_hash['diagnosis'].nil?
      result['procedure'] = json_hash['procedure'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          ClaimProcedure.transform_json(var) 
        end
      } unless json_hash['procedure'].nil?
      result['insurance'] = json_hash['insurance'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          ClaimInsurance.transform_json(var) 
        end
      } unless json_hash['insurance'].nil?
      result['accident'] = ClaimAccident.transform_json(json_hash['accident']) unless json_hash['accident'].nil?
      result['item'] = json_hash['item'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          ClaimItem.transform_json(var) 
        end
      } unless json_hash['item'].nil?
      result['total'] = Money.transform_json(json_hash['total']) unless json_hash['total'].nil?

      result
    end
  end
end
