module FHIR
  # fhir/adverse_event_actuality.rb
  class AdverseEventActuality < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'AdverseEventActuality'
    field :value, type: String

    def self.transform_json(json_hash)
      result = AdverseEventActuality.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
