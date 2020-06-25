module FHIR
  # fhir/measure_report_status.rb
  class MeasureReportStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'MeasureReportStatus'
    field :value, type: String

    def self.transform_json(json_hash)
      result = MeasureReportStatus.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
