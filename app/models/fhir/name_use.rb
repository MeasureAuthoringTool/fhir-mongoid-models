module FHIR
  # fhir/name_use.rb
  class NameUse < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'NameUse'
    field :value, type: String

    def self.transform_json(json_hash)
      result = NameUse.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
