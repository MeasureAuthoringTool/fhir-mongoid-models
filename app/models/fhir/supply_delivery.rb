module FHIR
  # fhir/supply_delivery.rb
  class SupplyDelivery < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'SupplyDelivery'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_many :basedOn, class_name: 'Reference'
    embeds_many :partOf, class_name: 'Reference'
    embeds_one :status, class_name: 'SupplyDeliveryStatus'
    embeds_one :patient, class_name: 'Reference'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :suppliedItem, class_name: 'SupplyDeliverySuppliedItem'
    embeds_one :occurrencedateTime, class_name: 'PrimitiveDateTime'
    embeds_one :occurrencePeriod, class_name: 'Period'
    embeds_one :occurrenceTiming, class_name: 'Timing'
    embeds_one :supplier, class_name: 'Reference'
    embeds_one :destination, class_name: 'Reference'
    embeds_many :receiver, class_name: 'Reference'

    def self.transform_json(json_hash)
      result = SupplyDelivery.new
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['basedOn'] = json_hash['basedOn'].map { |var| Reference.transform_json(var) } unless json_hash['basedOn'].nil?
      result['partOf'] = json_hash['partOf'].map { |var| Reference.transform_json(var) } unless json_hash['partOf'].nil?
      result['status'] = SupplyDeliveryStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['patient'] = Reference.transform_json(json_hash['patient']) unless json_hash['patient'].nil?      
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['suppliedItem'] = SupplyDeliverySuppliedItem.transform_json(json_hash['suppliedItem']) unless json_hash['suppliedItem'].nil?      
      result['occurrencedateTime'] = PrimitiveDateTime.transform_json(json_hash['occurrencedateTime'], json_hash['_occurrencedateTime']) unless json_hash['occurrencedateTime'].nil?      
      result['occurrencePeriod'] = Period.transform_json(json_hash['occurrencePeriod']) unless json_hash['occurrencePeriod'].nil?      
      result['occurrenceTiming'] = Timing.transform_json(json_hash['occurrenceTiming']) unless json_hash['occurrenceTiming'].nil?      
      result['supplier'] = Reference.transform_json(json_hash['supplier']) unless json_hash['supplier'].nil?      
      result['destination'] = Reference.transform_json(json_hash['destination']) unless json_hash['destination'].nil?      
      result['receiver'] = json_hash['receiver'].map { |var| Reference.transform_json(var) } unless json_hash['receiver'].nil?

      result
    end
  end
end
