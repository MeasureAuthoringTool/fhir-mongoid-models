module FHIR
  # fhir/trigger_definition.rb
  class TriggerDefinition < Element
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::TriggerType'    
    embeds_one :name, class_name: 'FHIR::PrimitiveString'    
    embeds_one :timingTiming, class_name: 'FHIR::Timing'    
    embeds_one :timingReference, class_name: 'FHIR::Reference'    
    embeds_one :timingDate, class_name: 'FHIR::PrimitiveDate'    
    embeds_one :timingDateTime, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_many :data, class_name: 'FHIR::DataRequirement'    
    embeds_one :condition, class_name: 'FHIR::Expression'    
    
    def as_json(*args)
      result = super      
      unless self.type.nil? 
        result['type'] = self.type.value
        serialized = Extension.serializePrimitiveExtension(self.type)            
        result['_type'] = serialized unless serialized.nil?
      end
      unless self.name.nil? 
        result['name'] = self.name.value
        serialized = Extension.serializePrimitiveExtension(self.name)            
        result['_name'] = serialized unless serialized.nil?
      end
      unless self.timingTiming.nil?
        result['timingTiming'] = self.timingTiming.as_json(*args)                        
      end          
      unless self.timingReference.nil?
        result['timingReference'] = self.timingReference.as_json(*args)                        
      end          
      unless self.timingDate.nil?
        result['timingDate'] = self.timingDate.value                        
        serialized = Extension.serializePrimitiveExtension(self.timingDate) 
        result['_timingDate'] = serialized unless serialized.nil?
      end          
      unless self.timingDateTime.nil?
        result['timingDateTime'] = self.timingDateTime.value                        
        serialized = Extension.serializePrimitiveExtension(self.timingDateTime) 
        result['_timingDateTime'] = serialized unless serialized.nil?
      end          
      unless self.data.nil?  || !self.data.any? 
        result['data'] = self.data.map{ |x| x.as_json(*args) }
      end
      unless self.condition.nil? 
        result['condition'] = self.condition.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = TriggerDefinition.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = TriggerType.transform_json(json_hash['type'], json_hash['_type']) unless json_hash['type'].nil?
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?
      result['timingTiming'] = Timing.transform_json(json_hash['timingTiming']) unless json_hash['timingTiming'].nil?
      result['timingReference'] = Reference.transform_json(json_hash['timingReference']) unless json_hash['timingReference'].nil?
      result['timingDate'] = PrimitiveDate.transform_json(json_hash['timingDate'], json_hash['_timingDate']) unless json_hash['timingDate'].nil?
      result['timingDateTime'] = PrimitiveDateTime.transform_json(json_hash['timingDateTime'], json_hash['_timingDateTime']) unless json_hash['timingDateTime'].nil?
      result['data'] = json_hash['data'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          DataRequirement.transform_json(var) 
        end
      } unless json_hash['data'].nil?
      result['condition'] = Expression.transform_json(json_hash['condition']) unless json_hash['condition'].nil?

      result
    end
  end
end
