module FHIR
  # fhir/discriminator_type.rb
  class DiscriminatorType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'DiscriminatorType'
    field :value, type: String

    def self.transform_json(json_hash)
      result = DiscriminatorType.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
