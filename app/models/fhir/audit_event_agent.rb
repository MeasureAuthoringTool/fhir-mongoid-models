module FHIR
  # fhir/audit_event_agent.rb
  class AuditEventAgent < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_many :role, class_name: 'FHIR::CodeableConcept'    
    embeds_one :who, class_name: 'FHIR::Reference'    
    embeds_one :altId, class_name: 'FHIR::PrimitiveString'    
    embeds_one :name, class_name: 'FHIR::PrimitiveString'    
    embeds_one :requestor, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :location, class_name: 'FHIR::Reference'    
    embeds_many :policy, class_name: 'FHIR::PrimitiveUri'    
    embeds_one :media, class_name: 'FHIR::Coding'    
    embeds_one :network, class_name: 'FHIR::AuditEventAgentNetwork'    
    embeds_many :purposeOfUse, class_name: 'FHIR::CodeableConcept'    
    
    def as_json(*args)
      result = super      
      unless self.type.nil? 
        result['type'] = self.type.as_json(*args)
      end
      unless self.role.nil?  || !self.role.any? 
        result['role'] = self.role.map{ |x| x.as_json(*args) }
      end
      unless self.who.nil? 
        result['who'] = self.who.as_json(*args)
      end
      unless self.altId.nil? 
        result['altId'] = self.altId.value
        serialized = Extension.serializePrimitiveExtension(self.altId)            
        result['_altId'] = serialized unless serialized.nil?
      end
      unless self.name.nil? 
        result['name'] = self.name.value
        serialized = Extension.serializePrimitiveExtension(self.name)            
        result['_name'] = serialized unless serialized.nil?
      end
      unless self.requestor.nil? 
        result['requestor'] = self.requestor.value
        serialized = Extension.serializePrimitiveExtension(self.requestor)            
        result['_requestor'] = serialized unless serialized.nil?
      end
      unless self.location.nil? 
        result['location'] = self.location.as_json(*args)
      end
      unless self.policy.nil?  || !self.policy.any? 
        result['policy'] = self.policy.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.policy)                              
        result['_policy'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.media.nil? 
        result['media'] = self.media.as_json(*args)
      end
      unless self.network.nil? 
        result['network'] = self.network.as_json(*args)
      end
      unless self.purposeOfUse.nil?  || !self.purposeOfUse.any? 
        result['purposeOfUse'] = self.purposeOfUse.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = AuditEventAgent.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['role'] = json_hash['role'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['role'].nil?
      result['who'] = Reference.transform_json(json_hash['who']) unless json_hash['who'].nil?
      result['altId'] = PrimitiveString.transform_json(json_hash['altId'], json_hash['_altId']) unless json_hash['altId'].nil?
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?
      result['requestor'] = PrimitiveBoolean.transform_json(json_hash['requestor'], json_hash['_requestor']) unless json_hash['requestor'].nil?
      result['location'] = Reference.transform_json(json_hash['location']) unless json_hash['location'].nil?
      result['policy'] = json_hash['policy'].each_with_index.map do |var, i|
        extension_hash = json_hash['_policy'] && json_hash['_policy'][i]
        PrimitiveUri.transform_json(var, extension_hash)
      end unless json_hash['policy'].nil?
      result['media'] = Coding.transform_json(json_hash['media']) unless json_hash['media'].nil?
      result['network'] = AuditEventAgentNetwork.transform_json(json_hash['network']) unless json_hash['network'].nil?
      result['purposeOfUse'] = json_hash['purposeOfUse'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['purposeOfUse'].nil?

      result
    end
  end
end
