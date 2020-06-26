module FHIR
  # fhir/allergy_intolerance_category.rb
  class AllergyIntoleranceCategory < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'AllergyIntoleranceCategory'
    field :value, type: String

    def self.transform_json(json_hash)
      result = AllergyIntoleranceCategory.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
