module FHIR
  # fhir/repository_type.rb
  class RepositoryType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'RepositoryType'
    field :value, type: String

    def self.transform_json(json_hash, target=RepositoryType.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
