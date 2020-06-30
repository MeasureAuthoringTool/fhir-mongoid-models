module FHIR
  # fhir/guide_parameter_code.rb
  class GuideParameterCode < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'GuideParameterCode'
    field :value, type: String

    def self.transform_json(json_hash, target=GuideParameterCode.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
