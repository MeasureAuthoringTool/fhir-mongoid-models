module FHIR
  # fhir/composition_attestation_mode.rb
  class CompositionAttestationMode < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'CompositionAttestationMode'
    field :value, type: String

    def self.transform_json(json_hash, target=CompositionAttestationMode.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
