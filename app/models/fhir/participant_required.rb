module FHIR
  # fhir/participant_required.rb
  class ParticipantRequired < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ParticipantRequired'
    field :value, type: String

    def self.transform_json(json_hash, target=ParticipantRequired.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
