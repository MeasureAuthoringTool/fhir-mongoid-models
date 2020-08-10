module FHIR
  # fhir/consent_provision.rb
  class ConsentProvision < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::ConsentProvisionType'    
    embeds_one :period, class_name: 'FHIR::Period'    
    embeds_many :actor, class_name: 'FHIR::ConsentProvisionActor'    
    embeds_many :action, class_name: 'FHIR::CodeableConcept'    
    embeds_many :securityLabel, class_name: 'FHIR::Coding'    
    embeds_many :purpose, class_name: 'FHIR::Coding'    
    embeds_many :class_local, class_name: 'FHIR::Coding'    
    embeds_many :code, class_name: 'FHIR::CodeableConcept'    
    embeds_one :dataPeriod, class_name: 'FHIR::Period'    
    embeds_many :data, class_name: 'FHIR::ConsentProvisionData'    
    embeds_many :provision, class_name: 'FHIR::ConsentProvision'    
    
    def as_json(*args)
      result = super      
      unless self.type.nil? 
        result['type'] = self.type.value
        serialized = Extension.serializePrimitiveExtension(self.type)            
        result['_type'] = serialized unless serialized.nil?
      end
      unless self.period.nil? 
        result['period'] = self.period.as_json(*args)
      end
      unless self.actor.nil?  || !self.actor.any? 
        result['actor'] = self.actor.map{ |x| x.as_json(*args) }
      end
      unless self.action.nil?  || !self.action.any? 
        result['action'] = self.action.map{ |x| x.as_json(*args) }
      end
      unless self.securityLabel.nil?  || !self.securityLabel.any? 
        result['securityLabel'] = self.securityLabel.map{ |x| x.as_json(*args) }
      end
      unless self.purpose.nil?  || !self.purpose.any? 
        result['purpose'] = self.purpose.map{ |x| x.as_json(*args) }
      end
      unless self.class_local.nil?  || !self.class_local.any? 
        result['class'] = self.class_local.map{ |x| x.as_json(*args) }
      end
      unless self.code.nil?  || !self.code.any? 
        result['code'] = self.code.map{ |x| x.as_json(*args) }
      end
      unless self.dataPeriod.nil? 
        result['dataPeriod'] = self.dataPeriod.as_json(*args)
      end
      unless self.data.nil?  || !self.data.any? 
        result['data'] = self.data.map{ |x| x.as_json(*args) }
      end
      unless self.provision.nil?  || !self.provision.any? 
        result['provision'] = self.provision.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ConsentProvision.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = ConsentProvisionType.transform_json(json_hash['type'], json_hash['_type']) unless json_hash['type'].nil?
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?
      result['actor'] = json_hash['actor'].map { |var| ConsentProvisionActor.transform_json(var) } unless json_hash['actor'].nil?
      result['action'] = json_hash['action'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['action'].nil?
      result['securityLabel'] = json_hash['securityLabel'].map { |var| Coding.transform_json(var) } unless json_hash['securityLabel'].nil?
      result['purpose'] = json_hash['purpose'].map { |var| Coding.transform_json(var) } unless json_hash['purpose'].nil?
      result['class_local'] = json_hash['class'].map { |var| Coding.transform_json(var) } unless json_hash['class'].nil?
      result['code'] = json_hash['code'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['code'].nil?
      result['dataPeriod'] = Period.transform_json(json_hash['dataPeriod']) unless json_hash['dataPeriod'].nil?
      result['data'] = json_hash['data'].map { |var| ConsentProvisionData.transform_json(var) } unless json_hash['data'].nil?
      result['provision'] = json_hash['provision'].map { |var| ConsentProvision.transform_json(var) } unless json_hash['provision'].nil?

      result
    end
  end
end
