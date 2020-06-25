module FHIR
  # fhir/medication_request_intent.rb
  class MedicationRequestIntent < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationRequestIntent'
    field :value, type: String

    def self.transform_json(json_hash)
      result = MedicationRequestIntent.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
