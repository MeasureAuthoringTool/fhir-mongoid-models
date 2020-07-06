module FHIR
  # fhir/schedule.rb
  class Schedule < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :active, class_name: 'PrimitiveBoolean'
    embeds_many :serviceCategory, class_name: 'CodeableConcept'
    embeds_many :serviceType, class_name: 'CodeableConcept'
    embeds_many :specialty, class_name: 'CodeableConcept'
    embeds_many :actor, class_name: 'Reference'
    embeds_one :planningHorizon, class_name: 'Period'
    embeds_one :comment, class_name: 'PrimitiveString'

    def self.transform_json(json_hash, target = Schedule.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['active'] = PrimitiveBoolean.transform_json(json_hash['active'], json_hash['_active']) unless json_hash['active'].nil?      
      result['serviceCategory'] = json_hash['serviceCategory'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['serviceCategory'].nil?
      result['serviceType'] = json_hash['serviceType'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['serviceType'].nil?
      result['specialty'] = json_hash['specialty'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['specialty'].nil?
      result['actor'] = json_hash['actor'].map { |var| Reference.transform_json(var) } unless json_hash['actor'].nil?
      result['planningHorizon'] = Period.transform_json(json_hash['planningHorizon']) unless json_hash['planningHorizon'].nil?      
      result['comment'] = PrimitiveString.transform_json(json_hash['comment'], json_hash['_comment']) unless json_hash['comment'].nil?      

      result
    end
  end
end
