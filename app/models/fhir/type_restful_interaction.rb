module FHIR
  # fhir/type_restful_interaction.rb
  class TypeRestfulInteraction < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'TypeRestfulInteraction'
    field :value, type: String

    def self.transform_json(json_hash)
      result = TypeRestfulInteraction.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
