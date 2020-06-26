module FHIR
  # fhir/device_request.rb
  class DeviceRequest < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'DeviceRequest'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_many :instantiatesCanonical, class_name: 'PrimitiveCanonical'
    embeds_many :instantiatesUri, class_name: 'PrimitiveUri'
    embeds_many :basedOn, class_name: 'Reference'
    embeds_many :priorRequest, class_name: 'Reference'
    embeds_one :groupIdentifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'DeviceRequestStatus'
    embeds_one :intent, class_name: 'RequestIntent'
    embeds_one :priority, class_name: 'RequestPriority'
    embeds_one :codeReference, class_name: 'Reference'
    embeds_one :codeCodeableConcept, class_name: 'CodeableConcept'
    embeds_many :parameter, class_name: 'DeviceRequestParameter'
    embeds_one :subject, class_name: 'Reference'
    embeds_one :encounter, class_name: 'Reference'
    embeds_one :occurrencedateTime, class_name: 'PrimitiveDateTime'
    embeds_one :occurrencePeriod, class_name: 'Period'
    embeds_one :occurrenceTiming, class_name: 'Timing'
    embeds_one :authoredOn, class_name: 'PrimitiveDateTime'
    embeds_one :requester, class_name: 'Reference'
    embeds_one :performerType, class_name: 'CodeableConcept'
    embeds_one :performer, class_name: 'Reference'
    embeds_many :reasonCode, class_name: 'CodeableConcept'
    embeds_many :reasonReference, class_name: 'Reference'
    embeds_many :insurance, class_name: 'Reference'
    embeds_many :supportingInfo, class_name: 'Reference'
    embeds_many :note, class_name: 'Annotation'
    embeds_many :relevantHistory, class_name: 'Reference'

    def self.transform_json(json_hash)
      result = DeviceRequest.new
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['instantiatesCanonical'] = json_hash['instantiatesCanonical'].each_with_index.map do |var, i|
        extension_hash = json_hash['_instantiatesCanonical'] && json_hash['_instantiatesCanonical'][i]
        PrimitiveCanonical.transform_json(var, extension_hash)
      end unless json_hash['instantiatesCanonical'].nil?
      result['instantiatesUri'] = json_hash['instantiatesUri'].each_with_index.map do |var, i|
        extension_hash = json_hash['_instantiatesUri'] && json_hash['_instantiatesUri'][i]
        PrimitiveUri.transform_json(var, extension_hash)
      end unless json_hash['instantiatesUri'].nil?
      result['basedOn'] = json_hash['basedOn'].map { |var| Reference.transform_json(var) } unless json_hash['basedOn'].nil?
      result['priorRequest'] = json_hash['priorRequest'].map { |var| Reference.transform_json(var) } unless json_hash['priorRequest'].nil?
      result['groupIdentifier'] = Identifier.transform_json(json_hash['groupIdentifier']) unless json_hash['groupIdentifier'].nil?      
      result['status'] = DeviceRequestStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['intent'] = RequestIntent.transform_json(json_hash['intent']) unless json_hash['intent'].nil?      
      result['priority'] = RequestPriority.transform_json(json_hash['priority']) unless json_hash['priority'].nil?      
      result['codeReference'] = Reference.transform_json(json_hash['codeReference']) unless json_hash['codeReference'].nil?      
      result['codeCodeableConcept'] = CodeableConcept.transform_json(json_hash['codeCodeableConcept']) unless json_hash['codeCodeableConcept'].nil?      
      result['parameter'] = json_hash['parameter'].map { |var| DeviceRequestParameter.transform_json(var) } unless json_hash['parameter'].nil?
      result['subject'] = Reference.transform_json(json_hash['subject']) unless json_hash['subject'].nil?      
      result['encounter'] = Reference.transform_json(json_hash['encounter']) unless json_hash['encounter'].nil?      
      result['occurrencedateTime'] = PrimitiveDateTime.transform_json(json_hash['occurrencedateTime'], json_hash['_occurrencedateTime']) unless json_hash['occurrencedateTime'].nil?      
      result['occurrencePeriod'] = Period.transform_json(json_hash['occurrencePeriod']) unless json_hash['occurrencePeriod'].nil?      
      result['occurrenceTiming'] = Timing.transform_json(json_hash['occurrenceTiming']) unless json_hash['occurrenceTiming'].nil?      
      result['authoredOn'] = PrimitiveDateTime.transform_json(json_hash['authoredOn'], json_hash['_authoredOn']) unless json_hash['authoredOn'].nil?      
      result['requester'] = Reference.transform_json(json_hash['requester']) unless json_hash['requester'].nil?      
      result['performerType'] = CodeableConcept.transform_json(json_hash['performerType']) unless json_hash['performerType'].nil?      
      result['performer'] = Reference.transform_json(json_hash['performer']) unless json_hash['performer'].nil?      
      result['reasonCode'] = json_hash['reasonCode'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['reasonCode'].nil?
      result['reasonReference'] = json_hash['reasonReference'].map { |var| Reference.transform_json(var) } unless json_hash['reasonReference'].nil?
      result['insurance'] = json_hash['insurance'].map { |var| Reference.transform_json(var) } unless json_hash['insurance'].nil?
      result['supportingInfo'] = json_hash['supportingInfo'].map { |var| Reference.transform_json(var) } unless json_hash['supportingInfo'].nil?
      result['note'] = json_hash['note'].map { |var| Annotation.transform_json(var) } unless json_hash['note'].nil?
      result['relevantHistory'] = json_hash['relevantHistory'].map { |var| Reference.transform_json(var) } unless json_hash['relevantHistory'].nil?

      result
    end
  end
end
