module FHIR
  # fhir/family_history_status.rb
  class FamilyHistoryStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'FamilyHistoryStatus'
    field :value, type: String

    def self.transform_json(json_hash)
      result = FamilyHistoryStatus.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
