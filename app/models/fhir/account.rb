module FHIR
  # fhir/account.rb
  class Account < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :status, class_name: 'FHIR::AccountStatus'    
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :name, class_name: 'FHIR::PrimitiveString'    
    embeds_many :subject, class_name: 'FHIR::Reference'    
    embeds_one :servicePeriod, class_name: 'FHIR::Period'    
    embeds_many :coverage, class_name: 'FHIR::AccountCoverage'    
    embeds_one :owner, class_name: 'FHIR::Reference'    
    embeds_one :description, class_name: 'FHIR::PrimitiveString'    
    embeds_many :guarantor, class_name: 'FHIR::AccountGuarantor'    
    embeds_one :partOf, class_name: 'FHIR::Reference'    
    
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
      unless self.name.nil? 
        result['name'] = self.name.value
        serialized = Extension.serializePrimitiveExtension(self.name)            
        result['_name'] = serialized unless serialized.nil?
      end
      unless self.subject.nil?  || !self.subject.any? 
        result['subject'] = self.subject.map{ |x| x.as_json(*args) }
      end
      unless self.servicePeriod.nil? 
        result['servicePeriod'] = self.servicePeriod.as_json(*args)
      end
      unless self.coverage.nil?  || !self.coverage.any? 
        result['coverage'] = self.coverage.map{ |x| x.as_json(*args) }
      end
      unless self.owner.nil? 
        result['owner'] = self.owner.as_json(*args)
      end
      unless self.description.nil? 
        result['description'] = self.description.value
        serialized = Extension.serializePrimitiveExtension(self.description)            
        result['_description'] = serialized unless serialized.nil?
      end
      unless self.guarantor.nil?  || !self.guarantor.any? 
        result['guarantor'] = self.guarantor.map{ |x| x.as_json(*args) }
      end
      unless self.partOf.nil? 
        result['partOf'] = self.partOf.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = Account.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Identifier.transform_json(var) 
        end
      } unless json_hash['identifier'].nil?
      result['status'] = AccountStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?
      result['subject'] = json_hash['subject'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['subject'].nil?
      result['servicePeriod'] = Period.transform_json(json_hash['servicePeriod']) unless json_hash['servicePeriod'].nil?
      result['coverage'] = json_hash['coverage'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          AccountCoverage.transform_json(var) 
        end
      } unless json_hash['coverage'].nil?
      result['owner'] = Reference.transform_json(json_hash['owner']) unless json_hash['owner'].nil?
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['guarantor'] = json_hash['guarantor'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          AccountGuarantor.transform_json(var) 
        end
      } unless json_hash['guarantor'].nil?
      result['partOf'] = Reference.transform_json(json_hash['partOf']) unless json_hash['partOf'].nil?

      result
    end
  end
end
