module FHIR
  # fhir/charge_item_definition_property_group.rb
  class ChargeItemDefinitionPropertyGroup < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ChargeItemDefinitionPropertyGroup'
    embeds_many :applicability, class_name: 'ChargeItemDefinitionApplicability'
    embeds_many :priceComponent, class_name: 'ChargeItemDefinitionPropertyGroupPriceComponent'

    def self.transform_json(json_hash)
      result = ChargeItemDefinitionPropertyGroup.new
      result['applicability'] = json_hash['applicability'].map { |var| ChargeItemDefinitionApplicability.transform_json(var) } unless json_hash['applicability'].nil?
      result['priceComponent'] = json_hash['priceComponent'].map { |var| ChargeItemDefinitionPropertyGroupPriceComponent.transform_json(var) } unless json_hash['priceComponent'].nil?

      result
    end
  end
end
