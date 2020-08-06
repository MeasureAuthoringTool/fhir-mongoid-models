module FHIR
  # fhir/group_member.rb
  class GroupMember < BackboneElement
    include Mongoid::Document
    embeds_one :entity, class_name: 'FHIR::Reference'    
    embeds_one :period, class_name: 'FHIR::Period'    
    embeds_one :inactive, class_name: 'FHIR::PrimitiveBoolean'    
    
    def as_json(*args)
      result = super      
      unless self.entity.nil? 
        result['entity'] = self.entity.as_json(*args)
      end
      unless self.period.nil? 
        result['period'] = self.period.as_json(*args)
      end
      unless self.inactive.nil? 
        result['inactive'] = self.inactive.value
        serialized = Extension.serializePrimitiveExtension(self.inactive)            
        result['_inactive'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = GroupMember.new)
      result = self.superclass.transform_json(json_hash, target)
      result['entity'] = Reference.transform_json(json_hash['entity']) unless json_hash['entity'].nil?
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?
      result['inactive'] = PrimitiveBoolean.transform_json(json_hash['inactive'], json_hash['_inactive']) unless json_hash['inactive'].nil?

      result
    end
  end
end
