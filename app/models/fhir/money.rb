module FHIR
  # fhir/money.rb
  class Money < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'Money'
    embeds_one :value, class_name: 'PrimitiveDecimal'
    embeds_one :currency, class_name: 'CurrencyCode'

    def self.transform_json(json_hash)
      result = Money.new
      result['value'] = PrimitiveDecimal.transform_json(json_hash['value'], json_hash['_value']) unless json_hash['value'].nil?      
      result['currency'] = CurrencyCode.transform_json(json_hash['currency']) unless json_hash['currency'].nil?      

      result
    end
  end
end
