module FHIR
  # fhir/specimen_collection.rb
  class SpecimenCollection < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SpecimenCollection'
    embeds_one :collector, class_name: 'Reference'
    embeds_one :collecteddateTime, class_name: 'PrimitiveDateTime'
    embeds_one :collectedPeriod, class_name: 'Period'
    embeds_one :duration, class_name: 'Duration'
    embeds_one :quantity, class_name: 'SimpleQuantity'
    embeds_one :method, class_name: 'CodeableConcept'
    embeds_one :bodySite, class_name: 'CodeableConcept'
    embeds_one :fastingStatusCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :fastingStatusDuration, class_name: 'Duration'

    def self.transform_json(json_hash)
      result = SpecimenCollection.new
      result['collector'] = Reference.transform_json(json_hash['collector']) unless json_hash['collector'].nil?      
      result['collecteddateTime'] = PrimitiveDateTime.transform_json(json_hash['collecteddateTime'], json_hash['_collecteddateTime']) unless json_hash['collecteddateTime'].nil?      
      result['collectedPeriod'] = Period.transform_json(json_hash['collectedPeriod']) unless json_hash['collectedPeriod'].nil?      
      result['duration'] = Duration.transform_json(json_hash['duration']) unless json_hash['duration'].nil?      
      result['quantity'] = SimpleQuantity.transform_json(json_hash['quantity']) unless json_hash['quantity'].nil?      
      result['method'] = CodeableConcept.transform_json(json_hash['method']) unless json_hash['method'].nil?      
      result['bodySite'] = CodeableConcept.transform_json(json_hash['bodySite']) unless json_hash['bodySite'].nil?      
      result['fastingStatusCodeableConcept'] = CodeableConcept.transform_json(json_hash['fastingStatusCodeableConcept']) unless json_hash['fastingStatusCodeableConcept'].nil?      
      result['fastingStatusDuration'] = Duration.transform_json(json_hash['fastingStatusDuration']) unless json_hash['fastingStatusDuration'].nil?      

      result
    end
  end
end
