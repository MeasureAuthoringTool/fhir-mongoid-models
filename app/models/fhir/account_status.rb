module FHIR
  # fhir/account_status.rb
  class AccountStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'AccountStatus'
    field :value, type: String

    def self.transform_json(json_hash, target=AccountStatus.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
