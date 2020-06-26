module FHIR
  # fhir/medication_request_status.rb
  class MedicationRequestStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationRequestStatus'
    field :value, type: String

    def self.transform_json(json_hash)
      result = MedicationRequestStatus.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
