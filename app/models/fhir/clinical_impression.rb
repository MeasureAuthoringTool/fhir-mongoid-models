module FHIR
  # fhir/clinical_impression.rb
  class ClinicalImpression < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'ClinicalImpression'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'ClinicalImpressionStatus'
    embeds_one :statusReason, class_name: 'CodeableConcept'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_one :description, class_name: 'PrimitiveString'
    embeds_one :subject, class_name: 'Reference'
    embeds_one :encounter, class_name: 'Reference'
    embeds_one :effectiveDateTime, class_name: 'PrimitiveDateTime'
    embeds_one :effectivePeriod, class_name: 'Period'
    embeds_one :date, class_name: 'PrimitiveDateTime'
    embeds_one :assessor, class_name: 'Reference'
    embeds_one :previous, class_name: 'Reference'
    embeds_many :problem, class_name: 'Reference'
    embeds_many :investigation, class_name: 'ClinicalImpressionInvestigation'
    embeds_many :protocol, class_name: 'PrimitiveUri'
    embeds_one :summary, class_name: 'PrimitiveString'
    embeds_many :finding, class_name: 'ClinicalImpressionFinding'
    embeds_many :prognosisCodeableConcept, class_name: 'CodeableConcept'
    embeds_many :prognosisReference, class_name: 'Reference'
    embeds_many :supportingInfo, class_name: 'Reference'
    embeds_many :note, class_name: 'Annotation'

    def self.transform_json(json_hash, target=ClinicalImpression.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['status'] = ClinicalImpressionStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['statusReason'] = CodeableConcept.transform_json(json_hash['statusReason']) unless json_hash['statusReason'].nil?      
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?      
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['subject'] = Reference.transform_json(json_hash['subject']) unless json_hash['subject'].nil?      
      result['encounter'] = Reference.transform_json(json_hash['encounter']) unless json_hash['encounter'].nil?      
      result['effectiveDateTime'] = PrimitiveDateTime.transform_json(json_hash['effectiveDateTime'], json_hash['_effectiveDateTime']) unless json_hash['effectiveDateTime'].nil?      
      result['effectivePeriod'] = Period.transform_json(json_hash['effectivePeriod']) unless json_hash['effectivePeriod'].nil?      
      result['date'] = PrimitiveDateTime.transform_json(json_hash['date'], json_hash['_date']) unless json_hash['date'].nil?      
      result['assessor'] = Reference.transform_json(json_hash['assessor']) unless json_hash['assessor'].nil?      
      result['previous'] = Reference.transform_json(json_hash['previous']) unless json_hash['previous'].nil?      
      result['problem'] = json_hash['problem'].map { |var| Reference.transform_json(var) } unless json_hash['problem'].nil?
      result['investigation'] = json_hash['investigation'].map { |var| ClinicalImpressionInvestigation.transform_json(var) } unless json_hash['investigation'].nil?
      result['protocol'] = json_hash['protocol'].each_with_index.map do |var, i|
        extension_hash = json_hash['_protocol'] && json_hash['_protocol'][i]
        PrimitiveUri.transform_json(var, extension_hash)
      end unless json_hash['protocol'].nil?
      result['summary'] = PrimitiveString.transform_json(json_hash['summary'], json_hash['_summary']) unless json_hash['summary'].nil?      
      result['finding'] = json_hash['finding'].map { |var| ClinicalImpressionFinding.transform_json(var) } unless json_hash['finding'].nil?
      result['prognosisCodeableConcept'] = json_hash['prognosisCodeableConcept'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['prognosisCodeableConcept'].nil?
      result['prognosisReference'] = json_hash['prognosisReference'].map { |var| Reference.transform_json(var) } unless json_hash['prognosisReference'].nil?
      result['supportingInfo'] = json_hash['supportingInfo'].map { |var| Reference.transform_json(var) } unless json_hash['supportingInfo'].nil?
      result['note'] = json_hash['note'].map { |var| Annotation.transform_json(var) } unless json_hash['note'].nil?

      result
    end
  end
end
