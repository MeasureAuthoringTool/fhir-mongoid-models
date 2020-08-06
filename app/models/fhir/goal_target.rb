module FHIR
  # fhir/goal_target.rb
  class GoalTarget < BackboneElement
    include Mongoid::Document
    embeds_one :measure, class_name: 'FHIR::CodeableConcept'    
    embeds_one :detailQuantity, class_name: 'FHIR::Quantity'    
    embeds_one :detailRange, class_name: 'FHIR::Range'    
    embeds_one :detailCodeableConcept, class_name: 'FHIR::CodeableConcept'    
    embeds_one :detailString, class_name: 'FHIR::PrimitiveString'    
    embeds_one :detailBoolean, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :detailInteger, class_name: 'FHIR::PrimitiveInteger'    
    embeds_one :detailRatio, class_name: 'FHIR::Ratio'    
    embeds_one :dueDate, class_name: 'FHIR::PrimitiveDate'    
    embeds_one :dueDuration, class_name: 'FHIR::Duration'    
    
    def as_json(*args)
      result = super      
      unless self.measure.nil? 
        result['measure'] = self.measure.as_json(*args)
      end
      unless self.detailQuantity.nil?
        result['detailQuantity'] = self.detailQuantity.as_json(*args)                        
      end          
      unless self.detailRange.nil?
        result['detailRange'] = self.detailRange.as_json(*args)                        
      end          
      unless self.detailCodeableConcept.nil?
        result['detailCodeableConcept'] = self.detailCodeableConcept.as_json(*args)                        
      end          
      unless self.detailString.nil?
        result['detailString'] = self.detailString.value                        
        serialized = Extension.serializePrimitiveExtension(self.detailString) 
        result['_detailString'] = serialized unless serialized.nil?
      end          
      unless self.detailBoolean.nil?
        result['detailBoolean'] = self.detailBoolean.value                        
        serialized = Extension.serializePrimitiveExtension(self.detailBoolean) 
        result['_detailBoolean'] = serialized unless serialized.nil?
      end          
      unless self.detailInteger.nil?
        result['detailInteger'] = self.detailInteger.value                        
        serialized = Extension.serializePrimitiveExtension(self.detailInteger) 
        result['_detailInteger'] = serialized unless serialized.nil?
      end          
      unless self.detailRatio.nil?
        result['detailRatio'] = self.detailRatio.as_json(*args)                        
      end          
      unless self.dueDate.nil?
        result['dueDate'] = self.dueDate.value                        
        serialized = Extension.serializePrimitiveExtension(self.dueDate) 
        result['_dueDate'] = serialized unless serialized.nil?
      end          
      unless self.dueDuration.nil?
        result['dueDuration'] = self.dueDuration.as_json(*args)                        
      end          
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = GoalTarget.new)
      result = self.superclass.transform_json(json_hash, target)
      result['measure'] = CodeableConcept.transform_json(json_hash['measure']) unless json_hash['measure'].nil?
      result['detailQuantity'] = Quantity.transform_json(json_hash['detailQuantity']) unless json_hash['detailQuantity'].nil?
      result['detailRange'] = Range.transform_json(json_hash['detailRange']) unless json_hash['detailRange'].nil?
      result['detailCodeableConcept'] = CodeableConcept.transform_json(json_hash['detailCodeableConcept']) unless json_hash['detailCodeableConcept'].nil?
      result['detailString'] = PrimitiveString.transform_json(json_hash['detailString'], json_hash['_detailString']) unless json_hash['detailString'].nil?
      result['detailBoolean'] = PrimitiveBoolean.transform_json(json_hash['detailBoolean'], json_hash['_detailBoolean']) unless json_hash['detailBoolean'].nil?
      result['detailInteger'] = PrimitiveInteger.transform_json(json_hash['detailInteger'], json_hash['_detailInteger']) unless json_hash['detailInteger'].nil?
      result['detailRatio'] = Ratio.transform_json(json_hash['detailRatio']) unless json_hash['detailRatio'].nil?
      result['dueDate'] = PrimitiveDate.transform_json(json_hash['dueDate'], json_hash['_dueDate']) unless json_hash['dueDate'].nil?
      result['dueDuration'] = Duration.transform_json(json_hash['dueDuration']) unless json_hash['dueDuration'].nil?

      result
    end
  end
end
