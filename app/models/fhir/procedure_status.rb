module FHIR
  # fhir/procedure_status.rb
  class ProcedureStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ProcedureStatus'
    field :value, type: String

    def self.transform_json(json_hash)
      result = ProcedureStatus.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
