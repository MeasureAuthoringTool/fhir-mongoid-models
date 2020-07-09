module FHIR
  # fhir/measure_report.rb
  class MeasureReport < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'
    embeds_one :status, class_name: 'FHIR::MeasureReportStatus'
    embeds_one :type, class_name: 'FHIR::MeasureReportType'
    embeds_one :measure, class_name: 'FHIR::PrimitiveCanonical'
    embeds_one :subject, class_name: 'FHIR::Reference'
    embeds_one :date, class_name: 'FHIR::PrimitiveDateTime'
    embeds_one :reporter, class_name: 'FHIR::Reference'
    embeds_one :period, class_name: 'FHIR::Period'
    embeds_one :improvementNotation, class_name: 'FHIR::CodeableConcept'
    embeds_many :group, class_name: 'FHIR::MeasureReportGroup'
    embeds_many :evaluatedResource, class_name: 'FHIR::Reference'

    def self.transform_json(json_hash, target = MeasureReport.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['status'] = MeasureReportStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['type'] = MeasureReportType.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['measure'] = PrimitiveCanonical.transform_json(json_hash['measure'], json_hash['_measure']) unless json_hash['measure'].nil?      
      result['subject'] = Reference.transform_json(json_hash['subject']) unless json_hash['subject'].nil?      
      result['date'] = PrimitiveDateTime.transform_json(json_hash['date'], json_hash['_date']) unless json_hash['date'].nil?      
      result['reporter'] = Reference.transform_json(json_hash['reporter']) unless json_hash['reporter'].nil?      
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?      
      result['improvementNotation'] = CodeableConcept.transform_json(json_hash['improvementNotation']) unless json_hash['improvementNotation'].nil?      
      result['group'] = json_hash['group'].map { |var| MeasureReportGroup.transform_json(var) } unless json_hash['group'].nil?
      result['evaluatedResource'] = json_hash['evaluatedResource'].map { |var| Reference.transform_json(var) } unless json_hash['evaluatedResource'].nil?

      result
    end
  end
end
