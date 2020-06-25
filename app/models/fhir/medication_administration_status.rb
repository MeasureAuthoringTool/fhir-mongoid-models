module FHIR
  # fhir/medication_administration_status.rb
  class MedicationAdministrationStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationAdministrationStatus'
    field :value, type: String

    def self.transform_json(json_hash)
      result = MedicationAdministrationStatus.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
