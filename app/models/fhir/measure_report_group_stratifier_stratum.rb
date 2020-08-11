module FHIR
  # fhir/measure_report_group_stratifier_stratum.rb
  class MeasureReportGroupStratifierStratum < BackboneElement
    include Mongoid::Document
    embeds_one :value, class_name: 'FHIR::CodeableConcept'    
    embeds_many :component, class_name: 'FHIR::MeasureReportGroupStratifierStratumComponent'    
    embeds_many :population, class_name: 'FHIR::MeasureReportGroupStratifierStratumPopulation'    
    embeds_one :measureScore, class_name: 'FHIR::Quantity'    
    
    def as_json(*args)
      result = super      
      unless self.value.nil? 
        result['value'] = self.value.as_json(*args)
      end
      unless self.component.nil?  || !self.component.any? 
        result['component'] = self.component.map{ |x| x.as_json(*args) }
      end
      unless self.population.nil?  || !self.population.any? 
        result['population'] = self.population.map{ |x| x.as_json(*args) }
      end
      unless self.measureScore.nil? 
        result['measureScore'] = self.measureScore.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = MeasureReportGroupStratifierStratum.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = CodeableConcept.transform_json(json_hash['value']) unless json_hash['value'].nil?
      result['component'] = json_hash['component'].map { |var| MeasureReportGroupStratifierStratumComponent.transform_json(var) } unless json_hash['component'].nil?
      result['population'] = json_hash['population'].map { |var| MeasureReportGroupStratifierStratumPopulation.transform_json(var) } unless json_hash['population'].nil?
      result['measureScore'] = Quantity.transform_json(json_hash['measureScore']) unless json_hash['measureScore'].nil?

      result
    end
  end
end
