module FHIR
  # fhir/consent_provision_actor.rb
  class ConsentProvisionActor < BackboneElement
    include Mongoid::Document
    embeds_one :role, class_name: 'CodeableConcept'
    embeds_one :reference, class_name: 'Reference'

    def self.transform_json(json_hash, target = ConsentProvisionActor.new)
      result = self.superclass.transform_json(json_hash, target)
      result['role'] = CodeableConcept.transform_json(json_hash['role']) unless json_hash['role'].nil?      
      result['reference'] = Reference.transform_json(json_hash['reference']) unless json_hash['reference'].nil?      

      result
    end
  end
end
