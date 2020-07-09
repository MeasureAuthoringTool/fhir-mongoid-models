module FHIR
  # fhir/claim_response_item_detail_sub_detail.rb
  class ClaimResponseItemDetailSubDetail < BackboneElement
    include Mongoid::Document
    embeds_one :subDetailSequence, class_name: 'FHIR::PrimitivePositiveInt'
    embeds_many :noteNumber, class_name: 'FHIR::PrimitivePositiveInt'
    embeds_many :adjudication, class_name: 'FHIR::ClaimResponseItemAdjudication'

    def self.transform_json(json_hash, target = ClaimResponseItemDetailSubDetail.new)
      result = self.superclass.transform_json(json_hash, target)
      result['subDetailSequence'] = PrimitivePositiveInt.transform_json(json_hash['subDetailSequence'], json_hash['_subDetailSequence']) unless json_hash['subDetailSequence'].nil?      
      result['noteNumber'] = json_hash['noteNumber'].each_with_index.map do |var, i|
        extension_hash = json_hash['_noteNumber'] && json_hash['_noteNumber'][i]
        PrimitivePositiveInt.transform_json(var, extension_hash)
      end unless json_hash['noteNumber'].nil?
      result['adjudication'] = json_hash['adjudication'].map { |var| ClaimResponseItemAdjudication.transform_json(var) } unless json_hash['adjudication'].nil?

      result
    end
  end
end
