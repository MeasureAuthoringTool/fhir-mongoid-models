module FHIR
  # fhir/conditional_delete_status.rb
  class ConditionalDeleteStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ConditionalDeleteStatus'
    field :value, type: String

    def self.transform_json(json_hash)
      result = ConditionalDeleteStatus.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
