module FHIR
  # fhir/provenance_entity.rb
  class ProvenanceEntity < BackboneElement
    include Mongoid::Document
    embeds_one :role, class_name: 'FHIR::ProvenanceEntityRole'    
    embeds_one :what, class_name: 'FHIR::Reference'    
    embeds_many :agent, class_name: 'FHIR::ProvenanceAgent'    
    
    def as_json(*args)
      result = super      
      unless self.role.nil? 
        result['role'] = self.role.value
        serialized = Extension.serializePrimitiveExtension(self.role)            
        result['_role'] = serialized unless serialized.nil?
      end
      unless self.what.nil? 
        result['what'] = self.what.as_json(*args)
      end
      unless self.agent.nil?  || !self.agent.any? 
        result['agent'] = self.agent.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ProvenanceEntity.new)
      result = self.superclass.transform_json(json_hash, target)
      result['role'] = ProvenanceEntityRole.transform_json(json_hash['role'], json_hash['_role']) unless json_hash['role'].nil?
      result['what'] = Reference.transform_json(json_hash['what']) unless json_hash['what'].nil?
      result['agent'] = json_hash['agent'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          ProvenanceAgent.transform_json(var) 
        end
      } unless json_hash['agent'].nil?

      result
    end
  end
end
