module FHIR
  # fhir/measure_report_group_stratifier.rb
  class MeasureReportGroupStratifier < BackboneElement
    include Mongoid::Document
    embeds_many :code, class_name: 'FHIR::CodeableConcept'
    embeds_many :stratum, class_name: 'FHIR::MeasureReportGroupStratifierStratum'

    def self.transform_json(json_hash, target = MeasureReportGroupStratifier.new)
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = json_hash['code'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['code'].nil?
      result['stratum'] = json_hash['stratum'].map { |var| MeasureReportGroupStratifierStratum.transform_json(var) } unless json_hash['stratum'].nil?

      result
    end
  end
end
