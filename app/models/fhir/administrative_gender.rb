module FHIR
  # fhir/administrative_gender.rb
  class AdministrativeGender < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'AdministrativeGender'
    field :value, type: String

    def self.transform_json(json_hash)
      result = AdministrativeGender.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
