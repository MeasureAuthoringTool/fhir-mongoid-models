module FHIR
  # fhir/immunization_reaction.rb
  class ImmunizationReaction < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ImmunizationReaction'
    embeds_one :date, class_name: 'PrimitiveDateTime'
    embeds_one :detail, class_name: 'Reference'
    embeds_one :reported, class_name: 'PrimitiveBoolean'

    def self.transform_json(json_hash)
      result = ImmunizationReaction.new
      result['date'] = PrimitiveDateTime.transform_json(json_hash['date'], json_hash['_date']) unless json_hash['date'].nil?      
      result['detail'] = Reference.transform_json(json_hash['detail']) unless json_hash['detail'].nil?      
      result['reported'] = PrimitiveBoolean.transform_json(json_hash['reported'], json_hash['_reported']) unless json_hash['reported'].nil?      

      result
    end
  end
end
