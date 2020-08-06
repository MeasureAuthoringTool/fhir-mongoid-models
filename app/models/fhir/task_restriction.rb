module FHIR
  # fhir/task_restriction.rb
  class TaskRestriction < BackboneElement
    include Mongoid::Document
    embeds_one :repetitions, class_name: 'FHIR::PrimitivePositiveInt'    
    embeds_one :period, class_name: 'FHIR::Period'    
    embeds_many :recipient, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.repetitions.nil? 
        result['repetitions'] = self.repetitions.value
        serialized = Extension.serializePrimitiveExtension(self.repetitions)            
        result['_repetitions'] = serialized unless serialized.nil?
      end
      unless self.period.nil? 
        result['period'] = self.period.as_json(*args)
      end
      unless self.recipient.nil?  || !self.recipient.any? 
        result['recipient'] = self.recipient.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = TaskRestriction.new)
      result = self.superclass.transform_json(json_hash, target)
      result['repetitions'] = PrimitivePositiveInt.transform_json(json_hash['repetitions'], json_hash['_repetitions']) unless json_hash['repetitions'].nil?
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?
      result['recipient'] = json_hash['recipient'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['recipient'].nil?

      result
    end
  end
end
