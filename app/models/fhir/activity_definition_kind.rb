module FHIR
  # fhir/activity_definition_kind.rb
  class ActivityDefinitionKind < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ActivityDefinitionKind'
    field :value, type: String

    def self.transform_json(json_hash)
      result = ActivityDefinitionKind.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
