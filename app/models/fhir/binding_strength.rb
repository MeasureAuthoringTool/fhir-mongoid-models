module FHIR
  # fhir/binding_strength.rb
  class BindingStrength < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'BindingStrength'
    field :value, type: String

    def self.transform_json(json_hash)
      result = BindingStrength.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
