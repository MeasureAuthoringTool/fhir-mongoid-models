module FHIR
  # fhir/allergy_intolerance_type.rb
  class AllergyIntoleranceType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'AllergyIntoleranceType'
    field :value, type: String

    def self.transform_json(json_hash, target=AllergyIntoleranceType.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
