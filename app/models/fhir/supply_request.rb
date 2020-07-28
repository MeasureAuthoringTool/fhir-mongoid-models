module FHIR
  # fhir/supply_request.rb
  class SupplyRequest < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :status, class_name: 'FHIR::SupplyRequestStatus'    
    embeds_one :category, class_name: 'FHIR::CodeableConcept'    
    embeds_one :priority, class_name: 'FHIR::RequestPriority'    
    embeds_one :itemCodeableConcept, class_name: 'FHIR::CodeableConcept'    
    embeds_one :itemReference, class_name: 'FHIR::Reference'    
    embeds_one :quantity, class_name: 'FHIR::Quantity'    
    embeds_many :parameter, class_name: 'FHIR::SupplyRequestParameter'    
    embeds_one :occurrenceDateTime, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :occurrencePeriod, class_name: 'FHIR::Period'    
    embeds_one :occurrenceTiming, class_name: 'FHIR::Timing'    
    embeds_one :authoredOn, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :requester, class_name: 'FHIR::Reference'    
    embeds_many :supplier, class_name: 'FHIR::Reference'    
    embeds_many :reasonCode, class_name: 'FHIR::CodeableConcept'    
    embeds_many :reasonReference, class_name: 'FHIR::Reference'    
    embeds_one :deliverFrom, class_name: 'FHIR::Reference'    
    embeds_one :deliverTo, class_name: 'FHIR::Reference'    

    def self.transform_json(json_hash, target = SupplyRequest.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['status'] = SupplyRequestStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?
      result['category'] = CodeableConcept.transform_json(json_hash['category']) unless json_hash['category'].nil?
      result['priority'] = RequestPriority.transform_json(json_hash['priority']) unless json_hash['priority'].nil?
      result['itemCodeableConcept'] = CodeableConcept.transform_json(json_hash['itemCodeableConcept']) unless json_hash['itemCodeableConcept'].nil?
      result['itemReference'] = Reference.transform_json(json_hash['itemReference']) unless json_hash['itemReference'].nil?
      result['quantity'] = Quantity.transform_json(json_hash['quantity']) unless json_hash['quantity'].nil?
      result['parameter'] = json_hash['parameter'].map { |var| SupplyRequestParameter.transform_json(var) } unless json_hash['parameter'].nil?
      result['occurrenceDateTime'] = PrimitiveDateTime.transform_json(json_hash['occurrenceDateTime'], json_hash['_occurrenceDateTime']) unless json_hash['occurrenceDateTime'].nil?
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
