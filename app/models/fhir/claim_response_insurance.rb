module FHIR
  # fhir/claim_response_insurance.rb
  class ClaimResponseInsurance < BackboneElement
    include Mongoid::Document
    embeds_one :sequence, class_name: 'PrimitivePositiveInt'
    embeds_one :focal, class_name: 'PrimitiveBoolean'
    embeds_one :coverage, class_name: 'Reference'
    embeds_one :businessArrangement, class_name: 'PrimitiveString'
    embeds_one :claimResponse, class_name: 'Reference'

    def self.transform_json(json_hash, target = ClaimResponseInsurance.new)
      result = self.superclass.transform_json(json_hash, target)
      result['sequence'] = PrimitivePositiveInt.transform_json(json_hash['sequence'], json_hash['_sequence']) unless json_hash['sequence'].nil?      
      result['focal'] = PrimitiveBoolean.transform_json(json_hash['focal'], json_hash['_focal']) unless json_hash['focal'].nil?      
      result['coverage'] = Reference.transform_json(json_hash['coverage']) unless json_hash['coverage'].nil?      
      result['businessArrangement'] = PrimitiveString.transform_json(json_hash['businessArrangement'], json_hash['_businessArrangement']) unless json_hash['businessArrangement'].nil?      
      result['claimResponse'] = Reference.transform_json(json_hash['claimResponse']) unless json_hash['claimResponse'].nil?      

      result
    end
  end
end
