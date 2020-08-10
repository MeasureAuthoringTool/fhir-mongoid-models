module FHIR
  # fhir/audit_event_entity.rb
  class AuditEventEntity < BackboneElement
    include Mongoid::Document
    embeds_one :what, class_name: 'FHIR::Reference'    
    embeds_one :type, class_name: 'FHIR::Coding'    
    embeds_one :role, class_name: 'FHIR::Coding'    
    embeds_one :lifecycle, class_name: 'FHIR::Coding'    
    embeds_many :securityLabel, class_name: 'FHIR::Coding'    
    embeds_one :name, class_name: 'FHIR::PrimitiveString'    
    embeds_one :description, class_name: 'FHIR::PrimitiveString'    
    embeds_one :query, class_name: 'FHIR::PrimitiveBase64Binary'    
    embeds_many :detail, class_name: 'FHIR::AuditEventEntityDetail'    
    
    def as_json(*args)
      result = super      
      unless self.what.nil? 
        result['what'] = self.what.as_json(*args)
      end
      unless self.type.nil? 
        result['type'] = self.type.as_json(*args)
      end
      unless self.role.nil? 
        result['role'] = self.role.as_json(*args)
      end
      unless self.lifecycle.nil? 
        result['lifecycle'] = self.lifecycle.as_json(*args)
      end
      unless self.securityLabel.nil?  || !self.securityLabel.any? 
        result['securityLabel'] = self.securityLabel.map{ |x| x.as_json(*args) }
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
      unless self.query.nil? 
        result['query'] = self.query.value
        serialized = Extension.serializePrimitiveExtension(self.query)            
        result['_query'] = serialized unless serialized.nil?
      end
      unless self.detail.nil?  || !self.detail.any? 
        result['detail'] = self.detail.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = AuditEventEntity.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['what'] = Reference.transform_json(json_hash['what']) unless json_hash['what'].nil?
      result['type'] = Coding.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['role'] = Coding.transform_json(json_hash['role']) unless json_hash['role'].nil?
      result['lifecycle'] = Coding.transform_json(json_hash['lifecycle']) unless json_hash['lifecycle'].nil?
      result['securityLabel'] = json_hash['securityLabel'].map { |var| Coding.transform_json(var) } unless json_hash['securityLabel'].nil?
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['query'] = PrimitiveBase64Binary.transform_json(json_hash['query'], json_hash['_query']) unless json_hash['query'].nil?
      result['detail'] = json_hash['detail'].map { |var| AuditEventEntityDetail.transform_json(var) } unless json_hash['detail'].nil?

      result
    end
  end
end
