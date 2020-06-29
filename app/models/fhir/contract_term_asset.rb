module FHIR
  # fhir/contract_term_asset.rb
  class ContractTermAsset < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ContractTermAsset'
    embeds_one :scope, class_name: 'CodeableConcept'
    embeds_many :type, class_name: 'CodeableConcept'
    embeds_many :typeReference, class_name: 'Reference'
    embeds_many :subtype, class_name: 'CodeableConcept'
    embeds_one :relationship, class_name: 'Coding'
    embeds_many :context, class_name: 'ContractTermAssetContext'
    embeds_one :condition, class_name: 'PrimitiveString'
    embeds_many :periodType, class_name: 'CodeableConcept'
    embeds_many :period, class_name: 'Period'
    embeds_many :usePeriod, class_name: 'Period'
    embeds_one :text, class_name: 'PrimitiveString'
    embeds_many :linkId, class_name: 'PrimitiveString'
    embeds_many :answer, class_name: 'ContractTermOfferAnswer'
    embeds_many :securityLabelNumber, class_name: 'PrimitiveUnsignedInt'
    embeds_many :valuedItem, class_name: 'ContractTermAssetValuedItem'

    def self.transform_json(json_hash, target=ContractTermAsset.new)
      result = self.superclass.transform_json(json_hash, target)
      result['scope'] = CodeableConcept.transform_json(json_hash['scope']) unless json_hash['scope'].nil?      
      result['type'] = json_hash['type'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['type'].nil?
      result['typeReference'] = json_hash['typeReference'].map { |var| Reference.transform_json(var) } unless json_hash['typeReference'].nil?
      result['subtype'] = json_hash['subtype'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['subtype'].nil?
      result['relationship'] = Coding.transform_json(json_hash['relationship']) unless json_hash['relationship'].nil?      
      result['context'] = json_hash['context'].map { |var| ContractTermAssetContext.transform_json(var) } unless json_hash['context'].nil?
      result['condition'] = PrimitiveString.transform_json(json_hash['condition'], json_hash['_condition']) unless json_hash['condition'].nil?      
      result['periodType'] = json_hash['periodType'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['periodType'].nil?
      result['period'] = json_hash['period'].map { |var| Period.transform_json(var) } unless json_hash['period'].nil?
      result['usePeriod'] = json_hash['usePeriod'].map { |var| Period.transform_json(var) } unless json_hash['usePeriod'].nil?
      result['text'] = PrimitiveString.transform_json(json_hash['text'], json_hash['_text']) unless json_hash['text'].nil?      
      result['linkId'] = json_hash['linkId'].each_with_index.map do |var, i|
        extension_hash = json_hash['_linkId'] && json_hash['_linkId'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['linkId'].nil?
      result['answer'] = json_hash['answer'].map { |var| ContractTermOfferAnswer.transform_json(var) } unless json_hash['answer'].nil?
      result['securityLabelNumber'] = json_hash['securityLabelNumber'].each_with_index.map do |var, i|
        extension_hash = json_hash['_securityLabelNumber'] && json_hash['_securityLabelNumber'][i]
        PrimitiveUnsignedInt.transform_json(var, extension_hash)
      end unless json_hash['securityLabelNumber'].nil?
      result['valuedItem'] = json_hash['valuedItem'].map { |var| ContractTermAssetValuedItem.transform_json(var) } unless json_hash['valuedItem'].nil?

      result
    end
  end
end
