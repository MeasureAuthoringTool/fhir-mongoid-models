module FHIR
  # fhir/trigger_definition.rb
  class TriggerDefinition < Element
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::TriggerType'    
    embeds_one :name, class_name: 'FHIR::PrimitiveString'    
    embeds_one :timingTiming, class_name: 'FHIR::Timing'    
    embeds_one :timingReference, class_name: 'FHIR::Reference'    
    embeds_one :timingDate, class_name: 'FHIR::PrimitiveDate'    
    embeds_one :timingDateTime, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_many :data, class_name: 'FHIR::DataRequirement'    
    embeds_one :condition, class_name: 'FHIR::Expression'    

    def self.transform_json(json_hash, target = TriggerDefinition.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = TriggerType.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?
      result['timingTiming'] = Timing.transform_json(json_hash['timingTiming']) unless json_hash['timingTiming'].nil?
      result['timingReference'] = Reference.transform_json(json_hash['timingReference']) unless json_hash['timingReference'].nil?
      result['timingDate'] = PrimitiveDate.transform_json(json_hash['timingDate'], json_hash['_timingDate']) unless json_hash['timingDate'].nil?
      result['timingDateTime'] = PrimitiveDateTime.transform_json(json_hash['timingDateTime'], json_hash['_timingDateTime']) unless json_hash['timingDateTime'].nil?
      result['data'] = json_hash['data'].map { |var| DataRequirement.transform_json(var) } unless json_hash['data'].nil?
      result['condition'] = Expression.transform_json(json_hash['condition']) unless json_hash['condition'].nil?

      result
    end
  end
end
