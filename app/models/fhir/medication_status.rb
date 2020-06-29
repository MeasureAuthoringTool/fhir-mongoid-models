module FHIR
  # fhir/medication_status.rb
  class MedicationStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationStatus'
    field :value, type: String

    def self.transform_json(json_hash, target=MedicationStatus.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
