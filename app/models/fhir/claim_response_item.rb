module FHIR
  # fhir/claim_response_item.rb
  class ClaimResponseItem < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ClaimResponseItem'
    embeds_one :itemSequence, class_name: 'PrimitivePositiveInt'
    embeds_many :noteNumber, class_name: 'PrimitivePositiveInt'
    embeds_many :adjudication, class_name: 'ClaimResponseItemAdjudication'
    embeds_many :detail, class_name: 'ClaimResponseItemDetail'

    def self.transform_json(json_hash, target=ClaimResponseItem.new)
      result = self.superclass.transform_json(json_hash, target)
      result['itemSequence'] = PrimitivePositiveInt.transform_json(json_hash['itemSequence'], json_hash['_itemSequence']) unless json_hash['itemSequence'].nil?      
      result['noteNumber'] = json_hash['noteNumber'].each_with_index.map do |var, i|
        extension_hash = json_hash['_noteNumber'] && json_hash['_noteNumber'][i]
        PrimitivePositiveInt.transform_json(var, extension_hash)
      end unless json_hash['noteNumber'].nil?
      result['adjudication'] = json_hash['adjudication'].map { |var| ClaimResponseItemAdjudication.transform_json(var) } unless json_hash['adjudication'].nil?
      result['detail'] = json_hash['detail'].map { |var| ClaimResponseItemDetail.transform_json(var) } unless json_hash['detail'].nil?

      result
    end
  end
end
