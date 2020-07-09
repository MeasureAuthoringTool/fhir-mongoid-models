module FHIR
  # fhir/contract_term.rb
  class ContractTerm < BackboneElement
    include Mongoid::Document
    embeds_one :identifier, class_name: 'FHIR::Identifier'
    embeds_one :issued, class_name: 'FHIR::PrimitiveDateTime'
    embeds_one :applies, class_name: 'FHIR::Period'
    embeds_one :topicCodeableConcept, class_name: 'FHIR::CodeableConcept'
    embeds_one :topicReference, class_name: 'FHIR::Reference'
    embeds_one :type, class_name: 'FHIR::CodeableConcept'
    embeds_one :subType, class_name: 'FHIR::CodeableConcept'
    embeds_one :text, class_name: 'FHIR::PrimitiveString'
    embeds_many :securityLabel, class_name: 'FHIR::ContractTermSecurityLabel'
    embeds_one :offer, class_name: 'FHIR::ContractTermOffer'
    embeds_many :asset, class_name: 'FHIR::ContractTermAsset'
    embeds_many :action, class_name: 'FHIR::ContractTermAction'
    embeds_many :group, class_name: 'FHIR::ContractTerm'

    def self.transform_json(json_hash, target = ContractTerm.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = Identifier.transform_json(json_hash['identifier']) unless json_hash['identifier'].nil?      
      result['issued'] = PrimitiveDateTime.transform_json(json_hash['issued'], json_hash['_issued']) unless json_hash['issued'].nil?      
      result['applies'] = Period.transform_json(json_hash['applies']) unless json_hash['applies'].nil?      
      result['topicCodeableConcept'] = CodeableConcept.transform_json(json_hash['topicCodeableConcept']) unless json_hash['topicCodeableConcept'].nil?      
      result['topicReference'] = Reference.transform_json(json_hash['topicReference']) unless json_hash['topicReference'].nil?      
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['subType'] = CodeableConcept.transform_json(json_hash['subType']) unless json_hash['subType'].nil?      
      result['text'] = PrimitiveString.transform_json(json_hash['text'], json_hash['_text']) unless json_hash['text'].nil?      
      result['securityLabel'] = json_hash['securityLabel'].map { |var| ContractTermSecurityLabel.transform_json(var) } unless json_hash['securityLabel'].nil?
      result['offer'] = ContractTermOffer.transform_json(json_hash['offer']) unless json_hash['offer'].nil?      
      result['asset'] = json_hash['asset'].map { |var| ContractTermAsset.transform_json(var) } unless json_hash['asset'].nil?
      result['action'] = json_hash['action'].map { |var| ContractTermAction.transform_json(var) } unless json_hash['action'].nil?
      result['group'] = json_hash['group'].map { |var| ContractTerm.transform_json(var) } unless json_hash['group'].nil?

      result
    end
  end
end
