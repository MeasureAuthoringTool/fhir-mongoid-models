module FHIR
  # fhir/bundle_type.rb
  class BundleType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'BundleType'
    field :value, type: String

    def self.transform_json(json_hash)
      result = BundleType.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
