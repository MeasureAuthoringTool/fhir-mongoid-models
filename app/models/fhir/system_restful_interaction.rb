module FHIR
  # fhir/system_restful_interaction.rb
  class SystemRestfulInteraction < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'SystemRestfulInteraction'
    field :value, type: String

    def self.transform_json(json_hash)
      result = SystemRestfulInteraction.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
