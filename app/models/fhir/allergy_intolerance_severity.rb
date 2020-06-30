module FHIR
  # fhir/allergy_intolerance_severity.rb
  class AllergyIntoleranceSeverity < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'AllergyIntoleranceSeverity'
    field :value, type: String

    def self.transform_json(json_hash, target=AllergyIntoleranceSeverity.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
