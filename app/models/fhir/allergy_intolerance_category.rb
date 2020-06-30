module FHIR
  # fhir/allergy_intolerance_category.rb
  class AllergyIntoleranceCategory < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'AllergyIntoleranceCategory'
    field :value, type: String

    def self.transform_json(json_hash, target=AllergyIntoleranceCategory.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
