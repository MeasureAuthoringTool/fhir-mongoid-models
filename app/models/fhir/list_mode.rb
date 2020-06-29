module FHIR
  # fhir/list_mode.rb
  class ListMode < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ListMode'
    field :value, type: String

    def self.transform_json(json_hash, target=ListMode.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
