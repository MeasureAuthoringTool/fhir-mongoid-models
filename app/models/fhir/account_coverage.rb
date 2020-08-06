module FHIR
  # fhir/account_coverage.rb
  class AccountCoverage < BackboneElement
    include Mongoid::Document
    embeds_one :coverage, class_name: 'FHIR::Reference'    
    embeds_one :priority, class_name: 'FHIR::PrimitivePositiveInt'    
    
    def as_json(*args)
      result = super      
      unless self.coverage.nil? 
        result['coverage'] = self.coverage.as_json(*args)
      end
      unless self.priority.nil? 
        result['priority'] = self.priority.value
        serialized = Extension.serializePrimitiveExtension(self.priority)            
        result['_priority'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = AccountCoverage.new)
      result = self.superclass.transform_json(json_hash, target)
      result['coverage'] = Reference.transform_json(json_hash['coverage']) unless json_hash['coverage'].nil?
      result['priority'] = PrimitivePositiveInt.transform_json(json_hash['priority'], json_hash['_priority']) unless json_hash['priority'].nil?

      result
    end
  end
end
