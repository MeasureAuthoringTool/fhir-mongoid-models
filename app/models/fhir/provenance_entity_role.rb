module FHIR
  # fhir/provenance_entity_role.rb
  class ProvenanceEntityRole < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ProvenanceEntityRole'
    field :value, type: String

    def self.transform_json(json_hash, target=ProvenanceEntityRole.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
