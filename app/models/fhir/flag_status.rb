module FHIR
  # fhir/flag_status.rb
  class FlagStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'FlagStatus'
    field :value, type: String

    def self.transform_json(json_hash)
      result = FlagStatus.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
