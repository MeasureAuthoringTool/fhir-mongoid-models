module FHIR
  # fhir/identifier.rb
  class Identifier < Element
    include Mongoid::Document
    embeds_one :use, class_name: 'FHIR::IdentifierUse'    
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :system, class_name: 'FHIR::PrimitiveUri'    
    embeds_one :value, class_name: 'FHIR::PrimitiveString'    
    embeds_one :period, class_name: 'FHIR::Period'    
    embeds_one :assigner, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.use.nil? 
        result['use'] = self.use.value
        serialized = Extension.serializePrimitiveExtension(self.use)            
        result['_use'] = serialized unless serialized.nil?
      end
      unless self.type.nil? 
        result['type'] = self.type.as_json(*args)
      end
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
      unless self.period.nil? 
        result['period'] = self.period.as_json(*args)
      end
      unless self.assigner.nil? 
        result['assigner'] = self.assigner.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = Identifier.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['use'] = IdentifierUse.transform_json(json_hash['use'], json_hash['_use']) unless json_hash['use'].nil?
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['system'] = PrimitiveUri.transform_json(json_hash['system'], json_hash['_system']) unless json_hash['system'].nil?
      result['value'] = PrimitiveString.transform_json(json_hash['value'], json_hash['_value']) unless json_hash['value'].nil?
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?
      result['assigner'] = Reference.transform_json(json_hash['assigner']) unless json_hash['assigner'].nil?

      result
    end
  end
end
