module FHIR
  # fhir/measure_report_group_population.rb
  class MeasureReportGroupPopulation < BackboneElement
    include Mongoid::Document
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_one :count, class_name: 'PrimitiveInteger'
    embeds_one :subjectResults, class_name: 'Reference'

    def self.transform_json(json_hash, target = MeasureReportGroupPopulation.new)
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?      
      result['count'] = PrimitiveInteger.transform_json(json_hash['count'], json_hash['_count']) unless json_hash['count'].nil?      
      result['subjectResults'] = Reference.transform_json(json_hash['subjectResults']) unless json_hash['subjectResults'].nil?      

      result
    end
  end
end
