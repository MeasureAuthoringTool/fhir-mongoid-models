module FHIR
  # fhir/research_study_status.rb
  class ResearchStudyStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ResearchStudyStatus'
    field :value, type: String

    def self.transform_json(json_hash)
      result = ResearchStudyStatus.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
