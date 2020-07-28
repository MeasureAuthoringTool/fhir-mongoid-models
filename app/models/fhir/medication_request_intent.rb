module FHIR
  # fhir/medication_request_intent.rb
  class MedicationRequestIntent < Element
    include Mongoid::Document
    field :value, type: String    

    def self.transform_json(json_hash, target = MedicationRequestIntent.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
