module FHIR
  # fhir/conditional_read_status.rb
  class ConditionalReadStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ConditionalReadStatus'
    field :value, type: String

    def self.transform_json(json_hash)
      result = ConditionalReadStatus.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
