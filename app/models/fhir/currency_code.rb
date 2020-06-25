module FHIR
  # fhir/currency_code.rb
  class CurrencyCode < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'CurrencyCode'
    field :value, type: String

    def self.transform_json(json_hash)
      result = CurrencyCode.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
