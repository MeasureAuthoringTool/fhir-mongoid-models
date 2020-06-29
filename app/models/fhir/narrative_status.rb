module FHIR
  # fhir/narrative_status.rb
  class NarrativeStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'NarrativeStatus'
    field :value, type: String

    def self.transform_json(json_hash, target=NarrativeStatus.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
