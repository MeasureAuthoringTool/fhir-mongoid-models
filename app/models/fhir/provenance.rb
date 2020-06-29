module FHIR
  # fhir/provenance.rb
  class Provenance < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'Provenance'
    embeds_many :target, class_name: 'Reference'
    embeds_one :occurredPeriod, class_name: 'Period'
    embeds_one :occurredDateTime, class_name: 'PrimitiveDateTime'
    embeds_one :recorded, class_name: 'PrimitiveInstant'
    embeds_many :policy, class_name: 'PrimitiveUri'
    embeds_one :location, class_name: 'Reference'
    embeds_many :reason, class_name: 'CodeableConcept'
    embeds_one :activity, class_name: 'CodeableConcept'
    embeds_many :agent, class_name: 'ProvenanceAgent'
    embeds_many :entity, class_name: 'ProvenanceEntity'
    embeds_many :signature, class_name: 'Signature'

    def self.transform_json(json_hash, target=Provenance.new)
      result = self.superclass.transform_json(json_hash, target)
      result['target'] = json_hash['target'].map { |var| Reference.transform_json(var) } unless json_hash['target'].nil?
      result['occurredPeriod'] = Period.transform_json(json_hash['occurredPeriod']) unless json_hash['occurredPeriod'].nil?      
      result['occurredDateTime'] = PrimitiveDateTime.transform_json(json_hash['occurredDateTime'], json_hash['_occurredDateTime']) unless json_hash['occurredDateTime'].nil?      
      result['recorded'] = PrimitiveInstant.transform_json(json_hash['recorded'], json_hash['_recorded']) unless json_hash['recorded'].nil?      
      result['policy'] = json_hash['policy'].each_with_index.map do |var, i|
        extension_hash = json_hash['_policy'] && json_hash['_policy'][i]
        PrimitiveUri.transform_json(var, extension_hash)
      end unless json_hash['policy'].nil?
      result['location'] = Reference.transform_json(json_hash['location']) unless json_hash['location'].nil?      
      result['reason'] = json_hash['reason'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['reason'].nil?
      result['activity'] = CodeableConcept.transform_json(json_hash['activity']) unless json_hash['activity'].nil?      
      result['agent'] = json_hash['agent'].map { |var| ProvenanceAgent.transform_json(var) } unless json_hash['agent'].nil?
      result['entity'] = json_hash['entity'].map { |var| ProvenanceEntity.transform_json(var) } unless json_hash['entity'].nil?
      result['signature'] = json_hash['signature'].map { |var| Signature.transform_json(var) } unless json_hash['signature'].nil?

      result
    end
  end
end
