module FHIR
  # fhir/contract_term_action.rb
  class ContractTermAction < BackboneElement
    include Mongoid::Document
    embeds_one :doNotPerform, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_many :subject, class_name: 'FHIR::ContractTermActionSubject'    
    embeds_one :intent, class_name: 'FHIR::CodeableConcept'    
    embeds_many :linkId, class_name: 'FHIR::PrimitiveString'    
    embeds_one :status, class_name: 'FHIR::CodeableConcept'    
    embeds_one :context, class_name: 'FHIR::Reference'    
    embeds_many :contextLinkId, class_name: 'FHIR::PrimitiveString'    
    embeds_one :occurrenceDateTime, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :occurrencePeriod, class_name: 'FHIR::Period'    
    embeds_one :occurrenceTiming, class_name: 'FHIR::Timing'    
    embeds_many :requester, class_name: 'FHIR::Reference'    
    embeds_many :requesterLinkId, class_name: 'FHIR::PrimitiveString'    
    embeds_many :performerType, class_name: 'FHIR::CodeableConcept'    
    embeds_one :performerRole, class_name: 'FHIR::CodeableConcept'    
    embeds_one :performer, class_name: 'FHIR::Reference'    
    embeds_many :performerLinkId, class_name: 'FHIR::PrimitiveString'    
    embeds_many :reasonCode, class_name: 'FHIR::CodeableConcept'    
    embeds_many :reasonReference, class_name: 'FHIR::Reference'    
    embeds_many :reason, class_name: 'FHIR::PrimitiveString'    
    embeds_many :reasonLinkId, class_name: 'FHIR::PrimitiveString'    
    embeds_many :note, class_name: 'FHIR::Annotation'    
    embeds_many :securityLabelNumber, class_name: 'FHIR::PrimitiveUnsignedInt'    

    def self.transform_json(json_hash, target = ContractTermAction.new)
      result = self.superclass.transform_json(json_hash, target)
      result['doNotPerform'] = PrimitiveBoolean.transform_json(json_hash['doNotPerform'], json_hash['_doNotPerform']) unless json_hash['doNotPerform'].nil?
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['subject'] = json_hash['subject'].map { |var| ContractTermActionSubject.transform_json(var) } unless json_hash['subject'].nil?
      result['intent'] = CodeableConcept.transform_json(json_hash['intent']) unless json_hash['intent'].nil?
      result['linkId'] = json_hash['linkId'].each_with_index.map do |var, i|
        extension_hash = json_hash['_linkId'] && json_hash['_linkId'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['linkId'].nil?
      result['status'] = CodeableConcept.transform_json(json_hash['status']) unless json_hash['status'].nil?
      result['context'] = Reference.transform_json(json_hash['context']) unless json_hash['context'].nil?
      result['contextLinkId'] = json_hash['contextLinkId'].each_with_index.map do |var, i|
        extension_hash = json_hash['_contextLinkId'] && json_hash['_contextLinkId'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['contextLinkId'].nil?
      result['occurrenceDateTime'] = PrimitiveDateTime.transform_json(json_hash['occurrenceDateTime'], json_hash['_occurrenceDateTime']) unless json_hash['occurrenceDateTime'].nil?
      result['occurrencePeriod'] = Period.transform_json(json_hash['occurrencePeriod']) unless json_hash['occurrencePeriod'].nil?
      result['occurrenceTiming'] = Timing.transform_json(json_hash['occurrenceTiming']) unless json_hash['occurrenceTiming'].nil?
      result['requester'] = json_hash['requester'].map { |var| Reference.transform_json(var) } unless json_hash['requester'].nil?
      result['requesterLinkId'] = json_hash['requesterLinkId'].each_with_index.map do |var, i|
        extension_hash = json_hash['_requesterLinkId'] && json_hash['_requesterLinkId'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['requesterLinkId'].nil?
      result['performerType'] = json_hash['performerType'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['performerType'].nil?
      result['performerRole'] = CodeableConcept.transform_json(json_hash['performerRole']) unless json_hash['performerRole'].nil?
      result['performer'] = Reference.transform_json(json_hash['performer']) unless json_hash['performer'].nil?
      result['performerLinkId'] = json_hash['performerLinkId'].each_with_index.map do |var, i|
        extension_hash = json_hash['_performerLinkId'] && json_hash['_performerLinkId'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['performerLinkId'].nil?
      result['reasonCode'] = json_hash['reasonCode'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['reasonCode'].nil?
      result['reasonReference'] = json_hash['reasonReference'].map { |var| Reference.transform_json(var) } unless json_hash['reasonReference'].nil?
      result['reason'] = json_hash['reason'].each_with_index.map do |var, i|
        extension_hash = json_hash['_reason'] && json_hash['_reason'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['reason'].nil?
      result['reasonLinkId'] = json_hash['reasonLinkId'].each_with_index.map do |var, i|
        extension_hash = json_hash['_reasonLinkId'] && json_hash['_reasonLinkId'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['reasonLinkId'].nil?
      result['note'] = json_hash['note'].map { |var| Annotation.transform_json(var) } unless json_hash['note'].nil?
      result['securityLabelNumber'] = json_hash['securityLabelNumber'].each_with_index.map do |var, i|
        extension_hash = json_hash['_securityLabelNumber'] && json_hash['_securityLabelNumber'][i]
        PrimitiveUnsignedInt.transform_json(var, extension_hash)
      end unless json_hash['securityLabelNumber'].nil?

      result
    end
  end
end
