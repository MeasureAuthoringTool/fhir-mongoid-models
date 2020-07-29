module FHIR
  # fhir/supply_delivery.rb
  class SupplyDelivery < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_many :basedOn, class_name: 'FHIR::Reference'    
    embeds_many :partOf, class_name: 'FHIR::Reference'    
    embeds_one :status, class_name: 'FHIR::SupplyDeliveryStatus'    
    embeds_one :patient, class_name: 'FHIR::Reference'    
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :suppliedItem, class_name: 'FHIR::SupplyDeliverySuppliedItem'    
    embeds_one :occurrenceDateTime, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :occurrencePeriod, class_name: 'FHIR::Period'    
    embeds_one :occurrenceTiming, class_name: 'FHIR::Timing'    
    embeds_one :supplier, class_name: 'FHIR::Reference'    
    embeds_one :destination, class_name: 'FHIR::Reference'    
    embeds_many :receiver, class_name: 'FHIR::Reference'    

    def self.transform_json(json_hash, target = SupplyDelivery.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['basedOn'] = json_hash['basedOn'].map { |var| Reference.transform_json(var) } unless json_hash['basedOn'].nil?
      result['partOf'] = json_hash['partOf'].map { |var| Reference.transform_json(var) } unless json_hash['partOf'].nil?
      result['status'] = SupplyDeliveryStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?
      result['patient'] = Reference.transform_json(json_hash['patient']) unless json_hash['patient'].nil?
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['suppliedItem'] = SupplyDeliverySuppliedItem.transform_json(json_hash['suppliedItem']) unless json_hash['suppliedItem'].nil?
      result['occurrenceDateTime'] = PrimitiveDateTime.transform_json(json_hash['occurrenceDateTime'], json_hash['_occurrenceDateTime']) unless json_hash['occurrenceDateTime'].nil?
      result['occurrencePeriod'] = Period.transform_json(json_hash['occurrencePeriod']) unless json_hash['occurrencePeriod'].nil?
      result['occurrenceTiming'] = Timing.transform_json(json_hash['occurrenceTiming']) unless json_hash['occurrenceTiming'].nil?
      result['supplier'] = Reference.transform_json(json_hash['supplier']) unless json_hash['supplier'].nil?
      result['destination'] = Reference.transform_json(json_hash['destination']) unless json_hash['destination'].nil?
      result['receiver'] = json_hash['receiver'].map { |var| Reference.transform_json(var) } unless json_hash['receiver'].nil?

      result
    end
  end
end
