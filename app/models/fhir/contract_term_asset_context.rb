module FHIR
  # fhir/contract_term_asset_context.rb
  class ContractTermAssetContext < BackboneElement
    include Mongoid::Document
    embeds_one :reference, class_name: 'Reference'
    embeds_many :code, class_name: 'CodeableConcept'
    embeds_one :text, class_name: 'PrimitiveString'

    def self.transform_json(json_hash, target = ContractTermAssetContext.new)
      result = self.superclass.transform_json(json_hash, target)
      result['reference'] = Reference.transform_json(json_hash['reference']) unless json_hash['reference'].nil?      
      result['code'] = json_hash['code'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['code'].nil?
      result['text'] = PrimitiveString.transform_json(json_hash['text'], json_hash['_text']) unless json_hash['text'].nil?      

      result
    end
  end
end
