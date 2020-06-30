module FHIR
  # fhir/message_significance_category.rb
  class MessageSignificanceCategory < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'MessageSignificanceCategory'
    field :value, type: String

    def self.transform_json(json_hash, target=MessageSignificanceCategory.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
