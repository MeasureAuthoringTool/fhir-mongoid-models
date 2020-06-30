module FHIR
  # fhir/bundle_type.rb
  class BundleType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'BundleType'
    field :value, type: String

    def self.transform_json(json_hash, target=BundleType.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
