module FHIR
  # fhir/specimen_collection.rb
  class SpecimenCollection < BackboneElement
    include Mongoid::Document
    embeds_one :collector, class_name: 'FHIR::Reference'    
    embeds_one :collectedDateTime, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :collectedPeriod, class_name: 'FHIR::Period'    
    embeds_one :duration, class_name: 'FHIR::Duration'    
    embeds_one :quantity, class_name: 'FHIR::SimpleQuantity'    
    embeds_one :method, class_name: 'FHIR::CodeableConcept'    
    embeds_one :bodySite, class_name: 'FHIR::CodeableConcept'    
    embeds_one :fastingStatusCodeableConcept, class_name: 'FHIR::CodeableConcept'    
    embeds_one :fastingStatusDuration, class_name: 'FHIR::Duration'    
    
    def as_json(*args)
      result = super      
      unless self.collector.nil? 
        result['collector'] = self.collector.as_json(*args)
      end
      unless self.collectedDateTime.nil?
        result['collectedDateTime'] = self.collectedDateTime.value                        
        serialized = Extension.serializePrimitiveExtension(self.collectedDateTime) 
        result['_collectedDateTime'] = serialized unless serialized.nil?
      end          
      unless self.collectedPeriod.nil?
        result['collectedPeriod'] = self.collectedPeriod.as_json(*args)                        
      end          
      unless self.duration.nil? 
        result['duration'] = self.duration.as_json(*args)
      end
      unless self.quantity.nil? 
        result['quantity'] = self.quantity.as_json(*args)
      end
      unless self.method.nil? 
        result['method'] = self.method.as_json(*args)
      end
      unless self.bodySite.nil? 
        result['bodySite'] = self.bodySite.as_json(*args)
      end
      unless self.fastingStatusCodeableConcept.nil?
        result['fastingStatusCodeableConcept'] = self.fastingStatusCodeableConcept.as_json(*args)                        
      end          
      unless self.fastingStatusDuration.nil?
        result['fastingStatusDuration'] = self.fastingStatusDuration.as_json(*args)                        
      end          
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = SpecimenCollection.new)
      result = self.superclass.transform_json(json_hash, target)
      result['collector'] = Reference.transform_json(json_hash['collector']) unless json_hash['collector'].nil?
      result['collectedDateTime'] = PrimitiveDateTime.transform_json(json_hash['collectedDateTime'], json_hash['_collectedDateTime']) unless json_hash['collectedDateTime'].nil?
      result['collectedPeriod'] = Period.transform_json(json_hash['collectedPeriod']) unless json_hash['collectedPeriod'].nil?
      result['duration'] = Duration.transform_json(json_hash['duration']) unless json_hash['duration'].nil?
      result['quantity'] = SimpleQuantity.transform_json(json_hash['quantity']) unless json_hash['quantity'].nil?
      result['method'] = CodeableConcept.transform_json(json_hash['method']) unless json_hash['method'].nil?
      result['bodySite'] = CodeableConcept.transform_json(json_hash['bodySite']) unless json_hash['bodySite'].nil?
      result['fastingStatusCodeableConcept'] = CodeableConcept.transform_json(json_hash['fastingStatusCodeableConcept']) unless json_hash['fastingStatusCodeableConcept'].nil?
      result['fastingStatusDuration'] = Duration.transform_json(json_hash['fastingStatusDuration']) unless json_hash['fastingStatusDuration'].nil?

      result
    end
  end
end
