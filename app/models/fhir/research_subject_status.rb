module FHIR
  # fhir/research_subject_status.rb
  class ResearchSubjectStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ResearchSubjectStatus'
    field :value, type: String

    def self.transform_json(json_hash)
      result = ResearchSubjectStatus.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
