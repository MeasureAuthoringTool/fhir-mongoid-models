module FHIR
  # fhir/charge_item_performer.rb
  class ChargeItemPerformer < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ChargeItemPerformer'
    embeds_one :function, class_name: 'CodeableConcept'
    embeds_one :actor, class_name: 'Reference'

    def self.transform_json(json_hash, target=ChargeItemPerformer.new)
      result = self.superclass.transform_json(json_hash, target)
      result['function'] = CodeableConcept.transform_json(json_hash['function']) unless json_hash['function'].nil?      
      result['actor'] = Reference.transform_json(json_hash['actor']) unless json_hash['actor'].nil?      

      result
    end
  end
end
