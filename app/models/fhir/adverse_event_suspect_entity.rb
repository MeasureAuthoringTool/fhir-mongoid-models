module FHIR
  # fhir/adverse_event_suspect_entity.rb
  class AdverseEventSuspectEntity < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'AdverseEventSuspectEntity'
    embeds_one :instance, class_name: 'Reference'
    embeds_many :causality, class_name: 'AdverseEventSuspectEntityCausality'

    def self.transform_json(json_hash, target=AdverseEventSuspectEntity.new)
      result = self.superclass.transform_json(json_hash, target)
      result['instance'] = Reference.transform_json(json_hash['instance']) unless json_hash['instance'].nil?      
      result['causality'] = json_hash['causality'].map { |var| AdverseEventSuspectEntityCausality.transform_json(var) } unless json_hash['causality'].nil?

      result
    end
  end
end
