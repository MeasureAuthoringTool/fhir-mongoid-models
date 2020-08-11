module FHIR
  # fhir/measure_report_group_stratifier_stratum_population.rb
  class MeasureReportGroupStratifierStratumPopulation < BackboneElement
    include Mongoid::Document
    embeds_one :code, class_name: 'FHIR::CodeableConcept'    
    embeds_one :count, class_name: 'FHIR::PrimitiveInteger'    
    embeds_one :subjectResults, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.code.nil? 
        result['code'] = self.code.as_json(*args)
      end
      unless self.count.nil? 
        result['count'] = self.count.value
        serialized = Extension.serializePrimitiveExtension(self.count)            
        result['_count'] = serialized unless serialized.nil?
      end
      unless self.subjectResults.nil? 
        result['subjectResults'] = self.subjectResults.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = MeasureReportGroupStratifierStratumPopulation.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?
      result['count'] = PrimitiveInteger.transform_json(json_hash['count'], json_hash['_count']) unless json_hash['count'].nil?
      result['subjectResults'] = Reference.transform_json(json_hash['subjectResults']) unless json_hash['subjectResults'].nil?

      result
    end
  end
end
