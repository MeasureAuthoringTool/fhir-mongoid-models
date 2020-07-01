module FHIR
  # fhir/charge_item_definition_applicability.rb
  class ChargeItemDefinitionApplicability < BackboneElement
    include Mongoid::Document
    embeds_one :description, class_name: 'PrimitiveString'
    embeds_one :language, class_name: 'PrimitiveString'
    embeds_one :expression, class_name: 'PrimitiveString'

    def self.transform_json(json_hash, target = ChargeItemDefinitionApplicability.new)
      result = self.superclass.transform_json(json_hash, target)
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['language'] = PrimitiveString.transform_json(json_hash['language'], json_hash['_language']) unless json_hash['language'].nil?      
      result['expression'] = PrimitiveString.transform_json(json_hash['expression'], json_hash['_expression']) unless json_hash['expression'].nil?      

      result
    end
  end
end
