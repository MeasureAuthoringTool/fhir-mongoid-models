module FHIR
  # fhir/contract_term_offer.rb
  class ContractTermOffer < BackboneElement
    include Mongoid::Document
    embeds_many :identifier, class_name: 'Identifier'
    embeds_many :party, class_name: 'ContractTermOfferParty'
    embeds_one :topic, class_name: 'Reference'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :decision, class_name: 'CodeableConcept'
    embeds_many :decisionMode, class_name: 'CodeableConcept'
    embeds_many :answer, class_name: 'ContractTermOfferAnswer'
    embeds_one :text, class_name: 'PrimitiveString'
    embeds_many :linkId, class_name: 'PrimitiveString'
    embeds_many :securityLabelNumber, class_name: 'PrimitiveUnsignedInt'

    def self.transform_json(json_hash, target = ContractTermOffer.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['party'] = json_hash['party'].map { |var| ContractTermOfferParty.transform_json(var) } unless json_hash['party'].nil?
      result['topic'] = Reference.transform_json(json_hash['topic']) unless json_hash['topic'].nil?      
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['decision'] = CodeableConcept.transform_json(json_hash['decision']) unless json_hash['decision'].nil?      
      result['decisionMode'] = json_hash['decisionMode'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['decisionMode'].nil?
      result['answer'] = json_hash['answer'].map { |var| ContractTermOfferAnswer.transform_json(var) } unless json_hash['answer'].nil?
      result['text'] = PrimitiveString.transform_json(json_hash['text'], json_hash['_text']) unless json_hash['text'].nil?      
      result['linkId'] = json_hash['linkId'].each_with_index.map do |var, i|
        extension_hash = json_hash['_linkId'] && json_hash['_linkId'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['linkId'].nil?
      result['securityLabelNumber'] = json_hash['securityLabelNumber'].each_with_index.map do |var, i|
        extension_hash = json_hash['_securityLabelNumber'] && json_hash['_securityLabelNumber'][i]
        PrimitiveUnsignedInt.transform_json(var, extension_hash)
      end unless json_hash['securityLabelNumber'].nil?

      result
    end
  end
end
