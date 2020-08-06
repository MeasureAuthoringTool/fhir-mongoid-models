module FHIR
  # fhir/medication_knowledge_cost.rb
  class MedicationKnowledgeCost < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :source, class_name: 'FHIR::PrimitiveString'    
    embeds_one :cost, class_name: 'FHIR::Money'    
    
    def as_json(*args)
      result = super      
      unless self.type.nil? 
        result['type'] = self.type.as_json(*args)
      end
      unless self.source.nil? 
        result['source'] = self.source.value
        serialized = Extension.serializePrimitiveExtension(self.source)            
        result['_source'] = serialized unless serialized.nil?
      end
      unless self.cost.nil? 
        result['cost'] = self.cost.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = MedicationKnowledgeCost.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['source'] = PrimitiveString.transform_json(json_hash['source'], json_hash['_source']) unless json_hash['source'].nil?
      result['cost'] = Money.transform_json(json_hash['cost']) unless json_hash['cost'].nil?

      result
    end
  end
end
