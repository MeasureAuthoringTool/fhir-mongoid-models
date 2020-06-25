module FHIR
  # fhir/age.rb
  class Age < Quantity
    include Mongoid::Document
    field :typeName, type: String, default: 'Age'

    def self.transform_json(json_hash)
      result = Age.new

      result
    end
  end
end
