module FHIR
  # fhir/supply_request.rb
  class SupplyRequest < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'SupplyRequest'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'SupplyRequestStatus'
    embeds_one :category, class_name: 'CodeableConcept'
    embeds_one :priority, class_name: 'RequestPriority'
    embeds_one :itemCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :itemReference, class_name: 'Reference'
    embeds_one :quantity, class_name: 'Quantity'
    embeds_many :parameter, class_name: 'SupplyRequestParameter'
    embeds_one :occurrencedateTime, class_name: 'PrimitiveDateTime'
    embeds_one :occurrencePeriod, class_name: 'Period'
    embeds_one :occurrenceTiming, class_name: 'Timing'
    embeds_one :authoredOn, class_name: 'PrimitiveDateTime'
    embeds_one :requester, class_name: 'Reference'
    embeds_many :supplier, class_name: 'Reference'
    embeds_many :reasonCode, class_name: 'CodeableConcept'
    embeds_many :reasonReference, class_name: 'Reference'
    embeds_one :deliverFrom, class_name: 'Reference'
    embeds_one :deliverTo, class_name: 'Reference'

    def self.transform_json(json_hash)
      result = SupplyRequest.new
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['status'] = SupplyRequestStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['category'] = CodeableConcept.transform_json(json_hash['category']) unless json_hash['category'].nil?      
      result['priority'] = RequestPriority.transform_json(json_hash['priority']) unless json_hash['priority'].nil?      
      result['itemCodeableConcept'] = CodeableConcept.transform_json(json_hash['itemCodeableConcept']) unless json_hash['itemCodeableConcept'].nil?      
      result['itemReference'] = Reference.transform_json(json_hash['itemReference']) unless json_hash['itemReference'].nil?      
      result['quantity'] = Quantity.transform_json(json_hash['quantity']) unless json_hash['quantity'].nil?      
      result['parameter'] = json_hash['parameter'].map { |var| SupplyRequestParameter.transform_json(var) } unless json_hash['parameter'].nil?
      result['occurrencedateTime'] = PrimitiveDateTime.transform_json(json_hash['occurrencedateTime'], json_hash['_occurrencedateTime']) unless json_hash['occurrencedateTime'].nil?      
      result['occurrencePeriod'] = Period.transform_json(json_hash['occurrencePeriod']) unless json_hash['occurrencePeriod'].nil?      
      result['occurrenceTiming'] = Timing.transform_json(json_hash['occurrenceTiming']) unless json_hash['occurrenceTiming'].nil?      
      result['authoredOn'] = PrimitiveDateTime.transform_json(json_hash['authoredOn'], json_hash['_authoredOn']) unless json_hash['authoredOn'].nil?      
      result['requester'] = Reference.transform_json(json_hash['requester']) unless json_hash['requester'].nil?      
      result['supplier'] = json_hash['supplier'].map { |var| Reference.transform_json(var) } unless json_hash['supplier'].nil?
      result['reasonCode'] = json_hash['reasonCode'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['reasonCode'].nil?
      result['reasonReference'] = json_hash['reasonReference'].map { |var| Reference.transform_json(var) } unless json_hash['reasonReference'].nil?
      result['deliverFrom'] = Reference.transform_json(json_hash['deliverFrom']) unless json_hash['deliverFrom'].nil?      
      result['deliverTo'] = Reference.transform_json(json_hash['deliverTo']) unless json_hash['deliverTo'].nil?      

      result
    end
  end
end
