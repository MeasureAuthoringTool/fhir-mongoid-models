module FHIR
  # fhir/contract.rb
  class Contract < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'Contract'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :url, class_name: 'PrimitiveUri'
    embeds_one :version, class_name: 'PrimitiveString'
    embeds_one :status, class_name: 'ContractStatus'
    embeds_one :legalState, class_name: 'CodeableConcept'
    embeds_one :instantiatesCanonical, class_name: 'Reference'
    embeds_one :instantiatesUri, class_name: 'PrimitiveUri'
    embeds_one :contentDerivative, class_name: 'CodeableConcept'
    embeds_one :issued, class_name: 'PrimitiveDateTime'
    embeds_one :applies, class_name: 'Period'
    embeds_one :expirationType, class_name: 'CodeableConcept'
    embeds_many :subject, class_name: 'Reference'
    embeds_many :authority, class_name: 'Reference'
    embeds_many :domain, class_name: 'Reference'
    embeds_many :site, class_name: 'Reference'
    embeds_one :name, class_name: 'PrimitiveString'
    embeds_one :title, class_name: 'PrimitiveString'
    embeds_one :subtitle, class_name: 'PrimitiveString'
    embeds_many :alias, class_name: 'PrimitiveString'
    embeds_one :author, class_name: 'Reference'
    embeds_one :scope, class_name: 'CodeableConcept'
    embeds_one :topicCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :topicReference, class_name: 'Reference'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_many :subType, class_name: 'CodeableConcept'
    embeds_one :contentDefinition, class_name: 'ContractContentDefinition'
    embeds_many :term, class_name: 'ContractTerm'
    embeds_many :supportingInfo, class_name: 'Reference'
    embeds_many :relevantHistory, class_name: 'Reference'
    embeds_many :signer, class_name: 'ContractSigner'
    embeds_many :friendly, class_name: 'ContractFriendly'
    embeds_many :legal, class_name: 'ContractLegal'
    embeds_many :rule, class_name: 'ContractRule'
    embeds_one :legallyBindingAttachment, class_name: 'Attachment'
    embeds_one :legallyBindingReference, class_name: 'Reference'

    def self.transform_json(json_hash)
      result = Contract.new
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['url'] = PrimitiveUri.transform_json(json_hash['url'], json_hash['_url']) unless json_hash['url'].nil?      
      result['version'] = PrimitiveString.transform_json(json_hash['version'], json_hash['_version']) unless json_hash['version'].nil?      
      result['status'] = ContractStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['legalState'] = CodeableConcept.transform_json(json_hash['legalState']) unless json_hash['legalState'].nil?      
      result['instantiatesCanonical'] = Reference.transform_json(json_hash['instantiatesCanonical']) unless json_hash['instantiatesCanonical'].nil?      
      result['instantiatesUri'] = PrimitiveUri.transform_json(json_hash['instantiatesUri'], json_hash['_instantiatesUri']) unless json_hash['instantiatesUri'].nil?      
      result['contentDerivative'] = CodeableConcept.transform_json(json_hash['contentDerivative']) unless json_hash['contentDerivative'].nil?      
      result['issued'] = PrimitiveDateTime.transform_json(json_hash['issued'], json_hash['_issued']) unless json_hash['issued'].nil?      
      result['applies'] = Period.transform_json(json_hash['applies']) unless json_hash['applies'].nil?      
      result['expirationType'] = CodeableConcept.transform_json(json_hash['expirationType']) unless json_hash['expirationType'].nil?      
      result['subject'] = json_hash['subject'].map { |var| Reference.transform_json(var) } unless json_hash['subject'].nil?
      result['authority'] = json_hash['authority'].map { |var| Reference.transform_json(var) } unless json_hash['authority'].nil?
      result['domain'] = json_hash['domain'].map { |var| Reference.transform_json(var) } unless json_hash['domain'].nil?
      result['site'] = json_hash['site'].map { |var| Reference.transform_json(var) } unless json_hash['site'].nil?
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?      
      result['title'] = PrimitiveString.transform_json(json_hash['title'], json_hash['_title']) unless json_hash['title'].nil?      
      result['subtitle'] = PrimitiveString.transform_json(json_hash['subtitle'], json_hash['_subtitle']) unless json_hash['subtitle'].nil?      
      result['alias'] = json_hash['alias'].each_with_index.map do |var, i|
        extension_hash = json_hash['_alias'] && json_hash['_alias'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['alias'].nil?
      result['author'] = Reference.transform_json(json_hash['author']) unless json_hash['author'].nil?      
      result['scope'] = CodeableConcept.transform_json(json_hash['scope']) unless json_hash['scope'].nil?      
      result['topicCodeableConcept'] = CodeableConcept.transform_json(json_hash['topicCodeableConcept']) unless json_hash['topicCodeableConcept'].nil?      
      result['topicReference'] = Reference.transform_json(json_hash['topicReference']) unless json_hash['topicReference'].nil?      
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['subType'] = json_hash['subType'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['subType'].nil?
      result['contentDefinition'] = ContractContentDefinition.transform_json(json_hash['contentDefinition']) unless json_hash['contentDefinition'].nil?      
      result['term'] = json_hash['term'].map { |var| ContractTerm.transform_json(var) } unless json_hash['term'].nil?
      result['supportingInfo'] = json_hash['supportingInfo'].map { |var| Reference.transform_json(var) } unless json_hash['supportingInfo'].nil?
      result['relevantHistory'] = json_hash['relevantHistory'].map { |var| Reference.transform_json(var) } unless json_hash['relevantHistory'].nil?
      result['signer'] = json_hash['signer'].map { |var| ContractSigner.transform_json(var) } unless json_hash['signer'].nil?
      result['friendly'] = json_hash['friendly'].map { |var| ContractFriendly.transform_json(var) } unless json_hash['friendly'].nil?
      result['legal'] = json_hash['legal'].map { |var| ContractLegal.transform_json(var) } unless json_hash['legal'].nil?
      result['rule'] = json_hash['rule'].map { |var| ContractRule.transform_json(var) } unless json_hash['rule'].nil?
      result['legallyBindingAttachment'] = Attachment.transform_json(json_hash['legallyBindingAttachment']) unless json_hash['legallyBindingAttachment'].nil?      
      result['legallyBindingReference'] = Reference.transform_json(json_hash['legallyBindingReference']) unless json_hash['legallyBindingReference'].nil?      

      result
    end
  end
end
