module FHIR
  # fhir/list_mode.rb
  class ListMode < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ListMode'
    field :value, type: String

    def self.transform_json(json_hash)
      result = ListMode.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
