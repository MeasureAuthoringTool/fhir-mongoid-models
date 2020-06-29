module FHIR
  # fhir/provenance_entity.rb
  class ProvenanceEntity < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ProvenanceEntity'
    embeds_one :role, class_name: 'ProvenanceEntityRole'
    embeds_one :what, class_name: 'Reference'
    embeds_many :agent, class_name: 'ProvenanceAgent'

    def self.transform_json(json_hash, target=ProvenanceEntity.new)
      result = self.superclass.transform_json(json_hash, target)
      result['role'] = ProvenanceEntityRole.transform_json(json_hash['role']) unless json_hash['role'].nil?      
      result['what'] = Reference.transform_json(json_hash['what']) unless json_hash['what'].nil?      
      result['agent'] = json_hash['agent'].map { |var| ProvenanceAgent.transform_json(var) } unless json_hash['agent'].nil?

      result
    end
  end
end
