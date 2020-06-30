module FHIR
  # fhir/filter_operator.rb
  class FilterOperator < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'FilterOperator'
    field :value, type: String

    def self.transform_json(json_hash, target=FilterOperator.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
