module FHIR
  # fhir/charge_item_status.rb
  class ChargeItemStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ChargeItemStatus'
    field :value, type: String

    def self.transform_json(json_hash, target=ChargeItemStatus.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
