module FHIR
  # fhir/claim_response_item_detail.rb
  class ClaimResponseItemDetail < BackboneElement
    include Mongoid::Document
    embeds_one :detailSequence, class_name: 'PrimitivePositiveInt'
    embeds_many :noteNumber, class_name: 'PrimitivePositiveInt'
    embeds_many :adjudication, class_name: 'ClaimResponseItemAdjudication'
    embeds_many :subDetail, class_name: 'ClaimResponseItemDetailSubDetail'

    def self.transform_json(json_hash, target = ClaimResponseItemDetail.new)
      result = self.superclass.transform_json(json_hash, target)
      result['detailSequence'] = PrimitivePositiveInt.transform_json(json_hash['detailSequence'], json_hash['_detailSequence']) unless json_hash['detailSequence'].nil?      
      result['noteNumber'] = json_hash['noteNumber'].each_with_index.map do |var, i|
        extension_hash = json_hash['_noteNumber'] && json_hash['_noteNumber'][i]
        PrimitivePositiveInt.transform_json(var, extension_hash)
      end unless json_hash['noteNumber'].nil?
      result['adjudication'] = json_hash['adjudication'].map { |var| ClaimResponseItemAdjudication.transform_json(var) } unless json_hash['adjudication'].nil?
      result['subDetail'] = json_hash['subDetail'].map { |var| ClaimResponseItemDetailSubDetail.transform_json(var) } unless json_hash['subDetail'].nil?

      result
    end
  end
end
