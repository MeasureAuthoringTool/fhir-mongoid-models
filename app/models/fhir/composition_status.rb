module FHIR
  # fhir/composition_status.rb
  class CompositionStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'CompositionStatus'
    field :value, type: String

    def self.transform_json(json_hash)
      result = CompositionStatus.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
