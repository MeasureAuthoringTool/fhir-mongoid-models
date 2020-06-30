module FHIR
  # fhir/medication_statement_status.rb
  class MedicationStatementStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationStatementStatus'
    field :value, type: String

    def self.transform_json(json_hash, target=MedicationStatementStatus.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
