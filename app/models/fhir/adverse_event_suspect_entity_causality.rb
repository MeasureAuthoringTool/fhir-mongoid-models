module FHIR
  # fhir/adverse_event_suspect_entity_causality.rb
  class AdverseEventSuspectEntityCausality < BackboneElement
    include Mongoid::Document
    embeds_one :assessment, class_name: 'CodeableConcept'
    embeds_one :productRelatedness, class_name: 'PrimitiveString'
    embeds_one :author, class_name: 'Reference'
    embeds_one :method, class_name: 'CodeableConcept'

    def self.transform_json(json_hash, target = AdverseEventSuspectEntityCausality.new)
      result = self.superclass.transform_json(json_hash, target)
      result['assessment'] = CodeableConcept.transform_json(json_hash['assessment']) unless json_hash['assessment'].nil?      
      result['productRelatedness'] = PrimitiveString.transform_json(json_hash['productRelatedness'], json_hash['_productRelatedness']) unless json_hash['productRelatedness'].nil?      
      result['author'] = Reference.transform_json(json_hash['author']) unless json_hash['author'].nil?      
      result['method'] = CodeableConcept.transform_json(json_hash['method']) unless json_hash['method'].nil?      

      result
    end
  end
end
