module FHIR
  # fhir/participation_status.rb
  class ParticipationStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ParticipationStatus'
    field :value, type: String

    def self.transform_json(json_hash)
      result = ParticipationStatus.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
