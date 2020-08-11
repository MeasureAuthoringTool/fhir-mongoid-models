module FHIR
  # fhir/measure_report_group.rb
  class MeasureReportGroup < BackboneElement
    include Mongoid::Document
    embeds_one :code, class_name: 'FHIR::CodeableConcept'    
    embeds_many :population, class_name: 'FHIR::MeasureReportGroupPopulation'    
    embeds_one :measureScore, class_name: 'FHIR::Quantity'    
    embeds_many :stratifier, class_name: 'FHIR::MeasureReportGroupStratifier'    
    
    def as_json(*args)
      result = super      
      unless self.code.nil? 
        result['code'] = self.code.as_json(*args)
      end
      unless self.population.nil?  || !self.population.any? 
        result['population'] = self.population.map{ |x| x.as_json(*args) }
      end
      unless self.measureScore.nil? 
        result['measureScore'] = self.measureScore.as_json(*args)
      end
      unless self.stratifier.nil?  || !self.stratifier.any? 
        result['stratifier'] = self.stratifier.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = MeasureReportGroup.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?
      result['population'] = json_hash['population'].map { |var| MeasureReportGroupPopulation.transform_json(var) } unless json_hash['population'].nil?
      result['measureScore'] = Quantity.transform_json(json_hash['measureScore']) unless json_hash['measureScore'].nil?
      result['stratifier'] = json_hash['stratifier'].map { |var| MeasureReportGroupStratifier.transform_json(var) } unless json_hash['stratifier'].nil?

      result
    end
  end
end
