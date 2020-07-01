module FHIR
  # fhir/specimen_contained_preference.rb
  class SpecimenContainedPreference < Element
    include Mongoid::Document
    field :value, type: String

    def self.transform_json(json_hash, target = SpecimenContainedPreference.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
