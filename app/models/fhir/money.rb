module FHIR
  # fhir/money.rb
  class Money < Element
    include Mongoid::Document
    embeds_one :value, class_name: 'FHIR::PrimitiveDecimal'
    embeds_one :currency, class_name: 'FHIR::CurrencyCode'

    def self.transform_json(json_hash, target = Money.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = PrimitiveDecimal.transform_json(json_hash['value'], json_hash['_value']) unless json_hash['value'].nil?      
      result['currency'] = CurrencyCode.transform_json(json_hash['currency']) unless json_hash['currency'].nil?      

      result
    end
  end
end
