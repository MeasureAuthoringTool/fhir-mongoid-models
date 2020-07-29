module FHIR
  # fhir/specimen_collection.rb
  class SpecimenCollection < BackboneElement
    include Mongoid::Document
    embeds_one :collector, class_name: 'FHIR::Reference'    
    embeds_one :collectedDateTime, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :collectedPeriod, class_name: 'FHIR::Period'    
    embeds_one :duration, class_name: 'FHIR::Duration'    
    embeds_one :quantity, class_name: 'FHIR::SimpleQuantity'    
    embeds_one :method, class_name: 'FHIR::CodeableConcept'    
    embeds_one :bodySite, class_name: 'FHIR::CodeableConcept'    
    embeds_one :fastingStatusCodeableConcept, class_name: 'FHIR::CodeableConcept'    
    embeds_one :fastingStatusDuration, class_name: 'FHIR::Duration'    

    def self.transform_json(json_hash, target = SpecimenCollection.new)
      result = self.superclass.transform_json(json_hash, target)
      result['collector'] = Reference.transform_json(json_hash['collector']) unless json_hash['collector'].nil?
      result['collectedDateTime'] = PrimitiveDateTime.transform_json(json_hash['collectedDateTime'], json_hash['_collectedDateTime']) unless json_hash['collectedDateTime'].nil?
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
