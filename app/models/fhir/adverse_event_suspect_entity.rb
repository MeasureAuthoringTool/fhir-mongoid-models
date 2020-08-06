module FHIR
  # fhir/adverse_event_suspect_entity.rb
  class AdverseEventSuspectEntity < BackboneElement
    include Mongoid::Document
    embeds_one :instance, class_name: 'FHIR::Reference'    
    embeds_many :causality, class_name: 'FHIR::AdverseEventSuspectEntityCausality'    
    
    def as_json(*args)
      result = super      
      unless self.instance.nil? 
        result['instance'] = self.instance.as_json(*args)
      end
      unless self.causality.nil?  || !self.causality.any? 
        result['causality'] = self.causality.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = AdverseEventSuspectEntity.new)
      result = self.superclass.transform_json(json_hash, target)
      result['instance'] = Reference.transform_json(json_hash['instance']) unless json_hash['instance'].nil?
      result['causality'] = json_hash['causality'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          AdverseEventSuspectEntityCausality.transform_json(var) 
        end
      } unless json_hash['causality'].nil?

      result
    end
  end
end
