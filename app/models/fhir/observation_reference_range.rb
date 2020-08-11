module FHIR
  # fhir/observation_reference_range.rb
  class ObservationReferenceRange < BackboneElement
    include Mongoid::Document
    embeds_one :low, class_name: 'FHIR::SimpleQuantity'    
    embeds_one :high, class_name: 'FHIR::SimpleQuantity'    
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_many :appliesTo, class_name: 'FHIR::CodeableConcept'    
    embeds_one :age, class_name: 'FHIR::Range'    
    embeds_one :text, class_name: 'FHIR::PrimitiveString'    
    
    def as_json(*args)
      result = super      
      unless self.low.nil? 
        result['low'] = self.low.as_json(*args)
      end
      unless self.high.nil? 
        result['high'] = self.high.as_json(*args)
      end
      unless self.type.nil? 
        result['type'] = self.type.as_json(*args)
      end
      unless self.appliesTo.nil?  || !self.appliesTo.any? 
        result['appliesTo'] = self.appliesTo.map{ |x| x.as_json(*args) }
      end
      unless self.age.nil? 
        result['age'] = self.age.as_json(*args)
      end
      unless self.text.nil? 
        result['text'] = self.text.value
        serialized = Extension.serializePrimitiveExtension(self.text)            
        result['_text'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ObservationReferenceRange.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['low'] = SimpleQuantity.transform_json(json_hash['low']) unless json_hash['low'].nil?
      result['high'] = SimpleQuantity.transform_json(json_hash['high']) unless json_hash['high'].nil?
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['appliesTo'] = json_hash['appliesTo'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['appliesTo'].nil?
      result['age'] = Range.transform_json(json_hash['age']) unless json_hash['age'].nil?
      result['text'] = PrimitiveString.transform_json(json_hash['text'], json_hash['_text']) unless json_hash['text'].nil?

      result
    end
  end
end
