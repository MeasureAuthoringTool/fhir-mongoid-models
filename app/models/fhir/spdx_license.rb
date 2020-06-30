module FHIR
  # fhir/spdx_license.rb
  class SPDXLicense < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'SPDXLicense'
    field :value, type: String

    def self.transform_json(json_hash, target=SPDXLicense.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
