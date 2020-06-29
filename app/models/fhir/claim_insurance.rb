module FHIR
  # fhir/claim_insurance.rb
  class ClaimInsurance < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ClaimInsurance'
    embeds_one :sequence, class_name: 'PrimitivePositiveInt'
    embeds_one :focal, class_name: 'PrimitiveBoolean'
    embeds_one :identifier, class_name: 'Identifier'
    embeds_one :coverage, class_name: 'Reference'
    embeds_one :businessArrangement, class_name: 'PrimitiveString'
    embeds_many :preAuthRef, class_name: 'PrimitiveString'
    embeds_one :claimResponse, class_name: 'Reference'

    def self.transform_json(json_hash, target=ClaimInsurance.new)
      result = self.superclass.transform_json(json_hash, target)
      result['sequence'] = PrimitivePositiveInt.transform_json(json_hash['sequence'], json_hash['_sequence']) unless json_hash['sequence'].nil?      
      result['focal'] = PrimitiveBoolean.transform_json(json_hash['focal'], json_hash['_focal']) unless json_hash['focal'].nil?      
      result['identifier'] = Identifier.transform_json(json_hash['identifier']) unless json_hash['identifier'].nil?      
      result['coverage'] = Reference.transform_json(json_hash['coverage']) unless json_hash['coverage'].nil?      
      result['businessArrangement'] = PrimitiveString.transform_json(json_hash['businessArrangement'], json_hash['_businessArrangement']) unless json_hash['businessArrangement'].nil?      
      result['preAuthRef'] = json_hash['preAuthRef'].each_with_index.map do |var, i|
        extension_hash = json_hash['_preAuthRef'] && json_hash['_preAuthRef'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['preAuthRef'].nil?
      result['claimResponse'] = Reference.transform_json(json_hash['claimResponse']) unless json_hash['claimResponse'].nil?      

      result
    end
  end
end
