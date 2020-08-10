module FHIR
  # fhir/contact_point.rb
  class ContactPoint < Element
    include Mongoid::Document
    embeds_one :system, class_name: 'FHIR::ContactPointSystem'    
    embeds_one :value, class_name: 'FHIR::PrimitiveString'    
    embeds_one :use, class_name: 'FHIR::ContactPointUse'    
    embeds_one :rank, class_name: 'FHIR::PrimitivePositiveInt'    
    embeds_one :period, class_name: 'FHIR::Period'    
    
    def as_json(*args)
      result = super      
      unless self.system.nil? 
        result['system'] = self.system.value
        serialized = Extension.serializePrimitiveExtension(self.system)            
        result['_system'] = serialized unless serialized.nil?
      end
      unless self.value.nil? 
        result['value'] = self.value.value
        serialized = Extension.serializePrimitiveExtension(self.value)            
        result['_value'] = serialized unless serialized.nil?
      end
      unless self.use.nil? 
        result['use'] = self.use.value
        serialized = Extension.serializePrimitiveExtension(self.use)            
        result['_use'] = serialized unless serialized.nil?
      end
      unless self.rank.nil? 
        result['rank'] = self.rank.value
        serialized = Extension.serializePrimitiveExtension(self.rank)            
        result['_rank'] = serialized unless serialized.nil?
      end
      unless self.period.nil? 
        result['period'] = self.period.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ContactPoint.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['system'] = ContactPointSystem.transform_json(json_hash['system'], json_hash['_system']) unless json_hash['system'].nil?
      result['value'] = PrimitiveString.transform_json(json_hash['value'], json_hash['_value']) unless json_hash['value'].nil?
      result['use'] = ContactPointUse.transform_json(json_hash['use'], json_hash['_use']) unless json_hash['use'].nil?
      result['rank'] = PrimitivePositiveInt.transform_json(json_hash['rank'], json_hash['_rank']) unless json_hash['rank'].nil?
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?

      result
    end
  end
end
