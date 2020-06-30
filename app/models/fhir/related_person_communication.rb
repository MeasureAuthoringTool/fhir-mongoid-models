module FHIR
  # fhir/related_person_communication.rb
  class RelatedPersonCommunication < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'RelatedPersonCommunication'
    embeds_one :language, class_name: 'CodeableConcept'
    embeds_one :preferred, class_name: 'PrimitiveBoolean'

    def self.transform_json(json_hash, target=RelatedPersonCommunication.new)
      result = self.superclass.transform_json(json_hash, target)
      result['language'] = CodeableConcept.transform_json(json_hash['language']) unless json_hash['language'].nil?      
      result['preferred'] = PrimitiveBoolean.transform_json(json_hash['preferred'], json_hash['_preferred']) unless json_hash['preferred'].nil?      

      result
    end
  end
end
