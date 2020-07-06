module FHIR
  # fhir/family_history_status.rb
  class FamilyHistoryStatus < Element
    include Mongoid::Document
    field :value, type: String

    def self.transform_json(json_hash, target = FamilyHistoryStatus.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
