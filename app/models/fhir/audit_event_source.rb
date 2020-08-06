module FHIR
  # fhir/audit_event_source.rb
  class AuditEventSource < BackboneElement
    include Mongoid::Document
    embeds_one :site, class_name: 'FHIR::PrimitiveString'    
    embeds_one :observer, class_name: 'FHIR::Reference'    
    embeds_many :type, class_name: 'FHIR::Coding'    
    
    def as_json(*args)
      result = super      
      unless self.site.nil? 
        result['site'] = self.site.value
        serialized = Extension.serializePrimitiveExtension(self.site)            
        result['_site'] = serialized unless serialized.nil?
      end
      unless self.observer.nil? 
        result['observer'] = self.observer.as_json(*args)
      end
      unless self.type.nil?  || !self.type.any? 
        result['type'] = self.type.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = AuditEventSource.new)
      result = self.superclass.transform_json(json_hash, target)
      result['site'] = PrimitiveString.transform_json(json_hash['site'], json_hash['_site']) unless json_hash['site'].nil?
      result['observer'] = Reference.transform_json(json_hash['observer']) unless json_hash['observer'].nil?
      result['type'] = json_hash['type'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Coding.transform_json(var) 
        end
      } unless json_hash['type'].nil?

      result
    end
  end
end
