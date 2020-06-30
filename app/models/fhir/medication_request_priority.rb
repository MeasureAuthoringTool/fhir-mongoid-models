module FHIR
  # fhir/medication_request_priority.rb
  class MedicationRequestPriority < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationRequestPriority'
    field :value, type: String

    def self.transform_json(json_hash, target=MedicationRequestPriority.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
