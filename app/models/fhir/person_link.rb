module FHIR
  # fhir/person_link.rb
  class PersonLink < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'PersonLink'
    embeds_one :target, class_name: 'Reference'
    embeds_one :assurance, class_name: 'IdentityAssuranceLevel'

    def self.transform_json(json_hash)
      result = PersonLink.new
      result['target'] = Reference.transform_json(json_hash['target']) unless json_hash['target'].nil?      
      result['assurance'] = IdentityAssuranceLevel.transform_json(json_hash['assurance']) unless json_hash['assurance'].nil?      

      result
    end
  end
end
