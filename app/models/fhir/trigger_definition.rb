module FHIR
  # fhir/trigger_definition.rb
  class TriggerDefinition < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'TriggerDefinition'
    embeds_one :type, class_name: 'TriggerType'
    embeds_one :name, class_name: 'PrimitiveString'
    embeds_one :timingTiming, class_name: 'Timing'
    embeds_one :timingReference, class_name: 'Reference'
    embeds_one :timingdate, class_name: 'PrimitiveDate'
    embeds_one :timingdateTime, class_name: 'PrimitiveDateTime'
    embeds_many :data, class_name: 'DataRequirement'
    embeds_one :condition, class_name: 'Expression'

    def self.transform_json(json_hash)
      result = TriggerDefinition.new
      result['type'] = TriggerType.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?      
      result['timingTiming'] = Timing.transform_json(json_hash['timingTiming']) unless json_hash['timingTiming'].nil?      
      result['timingReference'] = Reference.transform_json(json_hash['timingReference']) unless json_hash['timingReference'].nil?      
      result['timingdate'] = PrimitiveDate.transform_json(json_hash['timingdate'], json_hash['_timingdate']) unless json_hash['timingdate'].nil?      
      result['timingdateTime'] = PrimitiveDateTime.transform_json(json_hash['timingdateTime'], json_hash['_timingdateTime']) unless json_hash['timingdateTime'].nil?      
      result['data'] = json_hash['data'].map { |var| DataRequirement.transform_json(var) } unless json_hash['data'].nil?
      result['condition'] = Expression.transform_json(json_hash['condition']) unless json_hash['condition'].nil?      

      result
    end
  end
end
