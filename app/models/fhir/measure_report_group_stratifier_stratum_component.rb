module FHIR
  # fhir/measure_report_group_stratifier_stratum_component.rb
  class MeasureReportGroupStratifierStratumComponent < BackboneElement
    include Mongoid::Document
    embeds_one :code, class_name: 'FHIR::CodeableConcept'    
    embeds_one :value, class_name: 'FHIR::CodeableConcept'    
    
    def as_json(*args)
      result = super      
      unless self.code.nil? 
        result['code'] = self.code.as_json(*args)
      end
      unless self.value.nil? 
        result['value'] = self.value.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = MeasureReportGroupStratifierStratumComponent.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?
      result['value'] = CodeableConcept.transform_json(json_hash['value']) unless json_hash['value'].nil?

      result
    end
  end
end
