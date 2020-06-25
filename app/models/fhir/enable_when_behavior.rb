module FHIR
  # fhir/enable_when_behavior.rb
  class EnableWhenBehavior < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'EnableWhenBehavior'
    field :value, type: String

    def self.transform_json(json_hash)
      result = EnableWhenBehavior.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
