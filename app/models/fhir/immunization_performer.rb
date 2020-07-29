module FHIR
  # fhir/immunization_performer.rb
  class ImmunizationPerformer < BackboneElement
    include Mongoid::Document
    embeds_one :function, class_name: 'FHIR::CodeableConcept'    
    embeds_one :actor, class_name: 'FHIR::Reference'    

    def self.transform_json(json_hash, target = ImmunizationPerformer.new)
      result = self.superclass.transform_json(json_hash, target)
      result['function'] = CodeableConcept.transform_json(json_hash['function']) unless json_hash['function'].nil?
      result['actor'] = Reference.transform_json(json_hash['actor']) unless json_hash['actor'].nil?

      result
    end
  end
end
