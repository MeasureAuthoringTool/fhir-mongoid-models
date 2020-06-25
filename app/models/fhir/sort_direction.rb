module FHIR
  # fhir/sort_direction.rb
  class SortDirection < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'SortDirection'
    field :value, type: String

    def self.transform_json(json_hash)
      result = SortDirection.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
