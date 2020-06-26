module FHIR
  # fhir/procedure_performer.rb
  class ProcedurePerformer < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ProcedurePerformer'
    embeds_one :function, class_name: 'CodeableConcept'
    embeds_one :actor, class_name: 'Reference'
    embeds_one :onBehalfOf, class_name: 'Reference'

    def self.transform_json(json_hash)
      result = ProcedurePerformer.new
      result['function'] = CodeableConcept.transform_json(json_hash['function']) unless json_hash['function'].nil?      
      result['actor'] = Reference.transform_json(json_hash['actor']) unless json_hash['actor'].nil?      
      result['onBehalfOf'] = Reference.transform_json(json_hash['onBehalfOf']) unless json_hash['onBehalfOf'].nil?      

      result
    end
  end
end
