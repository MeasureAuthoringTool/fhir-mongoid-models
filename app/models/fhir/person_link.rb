module FHIR
  # fhir/person_link.rb
  class PersonLink < BackboneElement
    include Mongoid::Document
    embeds_one :target, class_name: 'FHIR::Reference'    
    embeds_one :assurance, class_name: 'FHIR::IdentityAssuranceLevel'    

    def self.transform_json(json_hash, target = PersonLink.new)
      result = self.superclass.transform_json(json_hash, target)
      result['target'] = Reference.transform_json(json_hash['target']) unless json_hash['target'].nil?
      result['assurance'] = IdentityAssuranceLevel.transform_json(json_hash['assurance']) unless json_hash['assurance'].nil?

      result
    end
  end
end
