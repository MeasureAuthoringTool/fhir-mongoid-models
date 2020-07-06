module FHIR
  # fhir/flag_status.rb
  class FlagStatus < Element
    include Mongoid::Document
    field :value, type: String

    def self.transform_json(json_hash, target = FlagStatus.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
