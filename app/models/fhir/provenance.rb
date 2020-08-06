module FHIR
  # fhir/provenance.rb
  class Provenance < DomainResource
    include Mongoid::Document
    embeds_many :target, class_name: 'FHIR::Reference'    
    embeds_one :occurredPeriod, class_name: 'FHIR::Period'    
    embeds_one :occurredDateTime, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :recorded, class_name: 'FHIR::PrimitiveInstant'    
    embeds_many :policy, class_name: 'FHIR::PrimitiveUri'    
    embeds_one :location, class_name: 'FHIR::Reference'    
    embeds_many :reason, class_name: 'FHIR::CodeableConcept'    
    embeds_one :activity, class_name: 'FHIR::CodeableConcept'    
    embeds_many :agent, class_name: 'FHIR::ProvenanceAgent'    
    embeds_many :entity, class_name: 'FHIR::ProvenanceEntity'    
    embeds_many :signature, class_name: 'FHIR::Signature'    
    
    def as_json(*args)
      result = super      
      unless self.target.nil?  || !self.target.any? 
        result['target'] = self.target.map{ |x| x.as_json(*args) }
      end
      unless self.occurredPeriod.nil?
        result['occurredPeriod'] = self.occurredPeriod.as_json(*args)                        
      end          
      unless self.occurredDateTime.nil?
        result['occurredDateTime'] = self.occurredDateTime.value                        
        serialized = Extension.serializePrimitiveExtension(self.occurredDateTime) 
        result['_occurredDateTime'] = serialized unless serialized.nil?
      end          
      unless self.recorded.nil? 
        result['recorded'] = self.recorded.value
        serialized = Extension.serializePrimitiveExtension(self.recorded)            
        result['_recorded'] = serialized unless serialized.nil?
      end
      unless self.policy.nil?  || !self.policy.any? 
        result['policy'] = self.policy.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.policy)                              
        result['_policy'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.location.nil? 
        result['location'] = self.location.as_json(*args)
      end
      unless self.reason.nil?  || !self.reason.any? 
        result['reason'] = self.reason.map{ |x| x.as_json(*args) }
      end
      unless self.activity.nil? 
        result['activity'] = self.activity.as_json(*args)
      end
      unless self.agent.nil?  || !self.agent.any? 
        result['agent'] = self.agent.map{ |x| x.as_json(*args) }
      end
      unless self.entity.nil?  || !self.entity.any? 
        result['entity'] = self.entity.map{ |x| x.as_json(*args) }
      end
      unless self.signature.nil?  || !self.signature.any? 
        result['signature'] = self.signature.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = Provenance.new)
      result = self.superclass.transform_json(json_hash, target)
      result['target'] = json_hash['target'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['target'].nil?
      result['occurredPeriod'] = Period.transform_json(json_hash['occurredPeriod']) unless json_hash['occurredPeriod'].nil?
      result['occurredDateTime'] = PrimitiveDateTime.transform_json(json_hash['occurredDateTime'], json_hash['_occurredDateTime']) unless json_hash['occurredDateTime'].nil?
      result['recorded'] = PrimitiveInstant.transform_json(json_hash['recorded'], json_hash['_recorded']) unless json_hash['recorded'].nil?
      result['policy'] = json_hash['policy'].each_with_index.map do |var, i|
        extension_hash = json_hash['_policy'] && json_hash['_policy'][i]
        PrimitiveUri.transform_json(var, extension_hash)
      end unless json_hash['policy'].nil?
      result['location'] = Reference.transform_json(json_hash['location']) unless json_hash['location'].nil?
      result['reason'] = json_hash['reason'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['reason'].nil?
      result['activity'] = CodeableConcept.transform_json(json_hash['activity']) unless json_hash['activity'].nil?
      result['agent'] = json_hash['agent'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          ProvenanceAgent.transform_json(var) 
        end
      } unless json_hash['agent'].nil?
      result['entity'] = json_hash['entity'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          ProvenanceEntity.transform_json(var) 
        end
      } unless json_hash['entity'].nil?
      result['signature'] = json_hash['signature'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Signature.transform_json(var) 
        end
      } unless json_hash['signature'].nil?

      result
    end
  end
end
