module FHIR
  # fhir/linkage_type.rb
  class LinkageType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'LinkageType'
    field :value, type: String

    def self.transform_json(json_hash, target=LinkageType.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
