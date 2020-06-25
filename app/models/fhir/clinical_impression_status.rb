module FHIR
  # fhir/clinical_impression_status.rb
  class ClinicalImpressionStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ClinicalImpressionStatus'
    field :value, type: String

    def self.transform_json(json_hash)
      result = ClinicalImpressionStatus.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
