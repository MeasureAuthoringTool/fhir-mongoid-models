module FHIR
  # fhir/provenance_agent.rb
  class ProvenanceAgent < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ProvenanceAgent'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_many :role, class_name: 'CodeableConcept'
    embeds_one :who, class_name: 'Reference'
    embeds_one :onBehalfOf, class_name: 'Reference'

    def self.transform_json(json_hash, target=ProvenanceAgent.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['role'] = json_hash['role'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['role'].nil?
      result['who'] = Reference.transform_json(json_hash['who']) unless json_hash['who'].nil?      
      result['onBehalfOf'] = Reference.transform_json(json_hash['onBehalfOf']) unless json_hash['onBehalfOf'].nil?      

      result
    end
  end
end
