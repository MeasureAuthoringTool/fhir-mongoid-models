module FHIR
  # fhir/medication_knowledge_regulatory_max_dispense.rb
  class MedicationKnowledgeRegulatoryMaxDispense < BackboneElement
    include Mongoid::Document
    embeds_one :quantity, class_name: 'FHIR::SimpleQuantity'    
    embeds_one :period, class_name: 'FHIR::Duration'    
    
    def as_json(*args)
      result = super      
      unless self.quantity.nil? 
        result['quantity'] = self.quantity.as_json(*args)
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

    def self.transform_json(json_hash, target = MedicationKnowledgeRegulatoryMaxDispense.new)
      result = self.superclass.transform_json(json_hash, target)
      result['quantity'] = SimpleQuantity.transform_json(json_hash['quantity']) unless json_hash['quantity'].nil?
      result['period'] = Duration.transform_json(json_hash['period']) unless json_hash['period'].nil?

      result
    end
  end
end
