module FHIR
  # fhir/duration.rb
  class Duration < Quantity
    include Mongoid::Document
    field :typeName, type: String, default: 'Duration'

    def self.transform_json(json_hash, target=Duration.new)
      result = self.superclass.transform_json(json_hash, target)

      result
    end
  end
end
