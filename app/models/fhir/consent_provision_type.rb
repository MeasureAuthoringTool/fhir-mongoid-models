module FHIR
  # fhir/consent_provision_type.rb
  class ConsentProvisionType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ConsentProvisionType'
    field :value, type: String

    def self.transform_json(json_hash, target=ConsentProvisionType.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
