module FHIR
  # fhir/specimen_status.rb
  class SpecimenStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'SpecimenStatus'
    field :value, type: String

    def self.transform_json(json_hash)
      result = SpecimenStatus.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
