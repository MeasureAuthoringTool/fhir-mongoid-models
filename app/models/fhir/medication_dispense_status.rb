module FHIR
  # fhir/medication_dispense_status.rb
  class MedicationDispenseStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationDispenseStatus'
    field :value, type: String

    def self.transform_json(json_hash, target=MedicationDispenseStatus.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
