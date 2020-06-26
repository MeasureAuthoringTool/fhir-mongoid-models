module FHIR
  # fhir/action_relationship_type.rb
  class ActionRelationshipType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ActionRelationshipType'
    field :value, type: String

    def self.transform_json(json_hash)
      result = ActionRelationshipType.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
