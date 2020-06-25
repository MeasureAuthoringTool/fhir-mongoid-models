module FHIR
  # fhir/coverage_status.rb
  class CoverageStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'CoverageStatus'
    field :value, type: String

    def self.transform_json(json_hash)
      result = CoverageStatus.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
