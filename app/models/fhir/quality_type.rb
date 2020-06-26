module FHIR
  # fhir/quality_type.rb
  class QualityType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'QualityType'
    field :value, type: String

    def self.transform_json(json_hash)
      result = QualityType.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
