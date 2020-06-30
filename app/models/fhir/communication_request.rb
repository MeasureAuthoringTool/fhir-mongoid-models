module FHIR
  # fhir/communication_request.rb
  class CommunicationRequest < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'CommunicationRequest'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_many :basedOn, class_name: 'Reference'
    embeds_many :replaces, class_name: 'Reference'
    embeds_one :groupIdentifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'CommunicationRequestStatus'
    embeds_one :statusReason, class_name: 'CodeableConcept'
    embeds_many :category, class_name: 'CodeableConcept'
    embeds_one :priority, class_name: 'CommunicationPriority'
    embeds_one :doNotPerform, class_name: 'PrimitiveBoolean'
    embeds_many :medium, class_name: 'CodeableConcept'
    embeds_one :subject, class_name: 'Reference'
    embeds_many :about, class_name: 'Reference'
    embeds_one :encounter, class_name: 'Reference'
    embeds_many :payload, class_name: 'CommunicationRequestPayload'
    embeds_one :occurrenceDateTime, class_name: 'PrimitiveDateTime'
    embeds_one :occurrencePeriod, class_name: 'Period'
    embeds_one :authoredOn, class_name: 'PrimitiveDateTime'
    embeds_one :requester, class_name: 'Reference'
    embeds_many :recipient, class_name: 'Reference'
    embeds_one :sender, class_name: 'Reference'
    embeds_many :reasonCode, class_name: 'CodeableConcept'
    embeds_many :reasonReference, class_name: 'Reference'
    embeds_many :note, class_name: 'Annotation'

    def self.transform_json(json_hash, target=CommunicationRequest.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['basedOn'] = json_hash['basedOn'].map { |var| Reference.transform_json(var) } unless json_hash['basedOn'].nil?
      result['replaces'] = json_hash['replaces'].map { |var| Reference.transform_json(var) } unless json_hash['replaces'].nil?
      result['groupIdentifier'] = Identifier.transform_json(json_hash['groupIdentifier']) unless json_hash['groupIdentifier'].nil?      
      result['status'] = CommunicationRequestStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['statusReason'] = CodeableConcept.transform_json(json_hash['statusReason']) unless json_hash['statusReason'].nil?      
      result['category'] = json_hash['category'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['category'].nil?
      result['priority'] = CommunicationPriority.transform_json(json_hash['priority']) unless json_hash['priority'].nil?      
      result['doNotPerform'] = PrimitiveBoolean.transform_json(json_hash['doNotPerform'], json_hash['_doNotPerform']) unless json_hash['doNotPerform'].nil?      
      result['medium'] = json_hash['medium'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['medium'].nil?
      result['subject'] = Reference.transform_json(json_hash['subject']) unless json_hash['subject'].nil?      
      result['about'] = json_hash['about'].map { |var| Reference.transform_json(var) } unless json_hash['about'].nil?
      result['encounter'] = Reference.transform_json(json_hash['encounter']) unless json_hash['encounter'].nil?      
      result['payload'] = json_hash['payload'].map { |var| CommunicationRequestPayload.transform_json(var) } unless json_hash['payload'].nil?
      result['occurrenceDateTime'] = PrimitiveDateTime.transform_json(json_hash['occurrenceDateTime'], json_hash['_occurrenceDateTime']) unless json_hash['occurrenceDateTime'].nil?      
      result['occurrencePeriod'] = Period.transform_json(json_hash['occurrencePeriod']) unless json_hash['occurrencePeriod'].nil?      
      result['authoredOn'] = PrimitiveDateTime.transform_json(json_hash['authoredOn'], json_hash['_authoredOn']) unless json_hash['authoredOn'].nil?      
      result['requester'] = Reference.transform_json(json_hash['requester']) unless json_hash['requester'].nil?      
      result['recipient'] = json_hash['recipient'].map { |var| Reference.transform_json(var) } unless json_hash['recipient'].nil?
      result['sender'] = Reference.transform_json(json_hash['sender']) unless json_hash['sender'].nil?      
      result['reasonCode'] = json_hash['reasonCode'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['reasonCode'].nil?
      result['reasonReference'] = json_hash['reasonReference'].map { |var| Reference.transform_json(var) } unless json_hash['reasonReference'].nil?
      result['note'] = json_hash['note'].map { |var| Annotation.transform_json(var) } unless json_hash['note'].nil?

      result
    end
  end
end
