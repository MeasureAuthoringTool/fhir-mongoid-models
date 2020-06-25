module FHIR
  # fhir/immunization_performer.rb
  class ImmunizationPerformer < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ImmunizationPerformer'
    embeds_one :function, class_name: 'CodeableConcept'
    embeds_one :actor, class_name: 'Reference'

    def self.transform_json(json_hash)
      result = ImmunizationPerformer.new
      result['function'] = CodeableConcept.transform_json(json_hash['function']) unless json_hash['function'].nil?      
      result['actor'] = Reference.transform_json(json_hash['actor']) unless json_hash['actor'].nil?      

      result
    end
  end
end
