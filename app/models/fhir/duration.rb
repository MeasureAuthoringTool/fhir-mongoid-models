module FHIR
  # fhir/duration.rb
  class Duration < Quantity
    include Mongoid::Document
    field :typeName, type: String, default: 'Duration'

    def self.transform_json(json_hash)
      result = Duration.new

      result
    end
  end
end
