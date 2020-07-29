module FHIR
  # fhir/device_use_statement_status.rb
  class DeviceUseStatementStatus < Element
    include Mongoid::Document
    field :value, type: String    

    def self.transform_json(json_hash, target = DeviceUseStatementStatus.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
