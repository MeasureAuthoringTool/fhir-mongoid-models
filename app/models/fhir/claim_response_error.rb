module FHIR
  # fhir/claim_response_error.rb
  class ClaimResponseError < BackboneElement
    include Mongoid::Document
    embeds_one :itemSequence, class_name: 'PrimitivePositiveInt'
    embeds_one :detailSequence, class_name: 'PrimitivePositiveInt'
    embeds_one :subDetailSequence, class_name: 'PrimitivePositiveInt'
    embeds_one :code, class_name: 'CodeableConcept'

    def self.transform_json(json_hash, target = ClaimResponseError.new)
      result = self.superclass.transform_json(json_hash, target)
      result['itemSequence'] = PrimitivePositiveInt.transform_json(json_hash['itemSequence'], json_hash['_itemSequence']) unless json_hash['itemSequence'].nil?      
      result['detailSequence'] = PrimitivePositiveInt.transform_json(json_hash['detailSequence'], json_hash['_detailSequence']) unless json_hash['detailSequence'].nil?      
      result['subDetailSequence'] = PrimitivePositiveInt.transform_json(json_hash['subDetailSequence'], json_hash['_subDetailSequence']) unless json_hash['subDetailSequence'].nil?      
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?      

      result
    end
  end
end
