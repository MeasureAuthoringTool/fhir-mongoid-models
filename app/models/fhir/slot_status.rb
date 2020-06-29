module FHIR
  # fhir/slot_status.rb
  class SlotStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'SlotStatus'
    field :value, type: String

    def self.transform_json(json_hash, target=SlotStatus.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
