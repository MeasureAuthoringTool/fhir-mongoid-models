module FHIR
  # fhir/care_team_status.rb
  class CareTeamStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'CareTeamStatus'
    field :value, type: String

    def self.transform_json(json_hash)
      result = CareTeamStatus.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
