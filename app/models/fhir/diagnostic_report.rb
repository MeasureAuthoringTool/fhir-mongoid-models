module FHIR
  # fhir/diagnostic_report.rb
  class DiagnosticReport < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'DiagnosticReport'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_many :basedOn, class_name: 'Reference'
    embeds_one :status, class_name: 'DiagnosticReportStatus'
    embeds_many :category, class_name: 'CodeableConcept'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_one :subject, class_name: 'Reference'
    embeds_one :encounter, class_name: 'Reference'
    embeds_one :effectiveDateTime, class_name: 'PrimitiveDateTime'
    embeds_one :effectivePeriod, class_name: 'Period'
    embeds_one :issued, class_name: 'PrimitiveInstant'
    embeds_many :performer, class_name: 'Reference'
    embeds_many :resultsInterpreter, class_name: 'Reference'
    embeds_many :specimen, class_name: 'Reference'
    embeds_many :result, class_name: 'Reference'
    embeds_many :imagingStudy, class_name: 'Reference'
    embeds_many :media, class_name: 'DiagnosticReportMedia'
    embeds_one :conclusion, class_name: 'PrimitiveString'
    embeds_many :conclusionCode, class_name: 'CodeableConcept'
    embeds_many :presentedForm, class_name: 'Attachment'

    def self.transform_json(json_hash, target=DiagnosticReport.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['basedOn'] = json_hash['basedOn'].map { |var| Reference.transform_json(var) } unless json_hash['basedOn'].nil?
      result['status'] = DiagnosticReportStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['category'] = json_hash['category'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['category'].nil?
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?      
      result['subject'] = Reference.transform_json(json_hash['subject']) unless json_hash['subject'].nil?      
      result['encounter'] = Reference.transform_json(json_hash['encounter']) unless json_hash['encounter'].nil?      
      result['effectiveDateTime'] = PrimitiveDateTime.transform_json(json_hash['effectiveDateTime'], json_hash['_effectiveDateTime']) unless json_hash['effectiveDateTime'].nil?      
      result['effectivePeriod'] = Period.transform_json(json_hash['effectivePeriod']) unless json_hash['effectivePeriod'].nil?      
      result['issued'] = PrimitiveInstant.transform_json(json_hash['issued'], json_hash['_issued']) unless json_hash['issued'].nil?      
      result['performer'] = json_hash['performer'].map { |var| Reference.transform_json(var) } unless json_hash['performer'].nil?
      result['resultsInterpreter'] = json_hash['resultsInterpreter'].map { |var| Reference.transform_json(var) } unless json_hash['resultsInterpreter'].nil?
      result['specimen'] = json_hash['specimen'].map { |var| Reference.transform_json(var) } unless json_hash['specimen'].nil?
      result['result'] = json_hash['result'].map { |var| Reference.transform_json(var) } unless json_hash['result'].nil?
      result['imagingStudy'] = json_hash['imagingStudy'].map { |var| Reference.transform_json(var) } unless json_hash['imagingStudy'].nil?
      result['media'] = json_hash['media'].map { |var| DiagnosticReportMedia.transform_json(var) } unless json_hash['media'].nil?
      result['conclusion'] = PrimitiveString.transform_json(json_hash['conclusion'], json_hash['_conclusion']) unless json_hash['conclusion'].nil?      
      result['conclusionCode'] = json_hash['conclusionCode'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['conclusionCode'].nil?
      result['presentedForm'] = json_hash['presentedForm'].map { |var| Attachment.transform_json(var) } unless json_hash['presentedForm'].nil?

      result
    end
  end
end
