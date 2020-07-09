module FHIR
  # fhir/service_request.rb
  class ServiceRequest < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'
    embeds_many :instantiatesCanonical, class_name: 'FHIR::PrimitiveCanonical'
    embeds_many :instantiatesUri, class_name: 'FHIR::PrimitiveUri'
    embeds_many :basedOn, class_name: 'FHIR::Reference'
    embeds_many :replaces, class_name: 'FHIR::Reference'
    embeds_one :requisition, class_name: 'FHIR::Identifier'
    embeds_one :status, class_name: 'FHIR::ServiceRequestStatus'
    embeds_one :intent, class_name: 'FHIR::ServiceRequestIntent'
    embeds_many :category, class_name: 'FHIR::CodeableConcept'
    embeds_one :priority, class_name: 'FHIR::ServiceRequestPriority'
    embeds_one :doNotPerform, class_name: 'FHIR::PrimitiveBoolean'
    embeds_one :code, class_name: 'FHIR::CodeableConcept'
    embeds_many :orderDetail, class_name: 'FHIR::CodeableConcept'
    embeds_one :quantityQuantity, class_name: 'FHIR::Quantity'
    embeds_one :quantityRatio, class_name: 'FHIR::Ratio'
    embeds_one :quantityRange, class_name: 'FHIR::Range'
    embeds_one :subject, class_name: 'FHIR::Reference'
    embeds_one :encounter, class_name: 'FHIR::Reference'
    embeds_one :occurrenceDateTime, class_name: 'FHIR::PrimitiveDateTime'
    embeds_one :occurrencePeriod, class_name: 'FHIR::Period'
    embeds_one :occurrenceTiming, class_name: 'FHIR::Timing'
    embeds_one :asNeededBoolean, class_name: 'FHIR::PrimitiveBoolean'
    embeds_one :asNeededCodeableConcept, class_name: 'FHIR::CodeableConcept'
    embeds_one :authoredOn, class_name: 'FHIR::PrimitiveDateTime'
    embeds_one :requester, class_name: 'FHIR::Reference'
    embeds_one :performerType, class_name: 'FHIR::CodeableConcept'
    embeds_many :performer, class_name: 'FHIR::Reference'
    embeds_many :locationCode, class_name: 'FHIR::CodeableConcept'
    embeds_many :locationReference, class_name: 'FHIR::Reference'
    embeds_many :reasonCode, class_name: 'FHIR::CodeableConcept'
    embeds_many :reasonReference, class_name: 'FHIR::Reference'
    embeds_many :insurance, class_name: 'FHIR::Reference'
    embeds_many :supportingInfo, class_name: 'FHIR::Reference'
    embeds_many :specimen, class_name: 'FHIR::Reference'
    embeds_many :bodySite, class_name: 'FHIR::CodeableConcept'
    embeds_many :note, class_name: 'FHIR::Annotation'
    embeds_one :patientInstruction, class_name: 'FHIR::PrimitiveString'
    embeds_many :relevantHistory, class_name: 'FHIR::Reference'

    def self.transform_json(json_hash, target = ServiceRequest.new)
      result = self.superclass.transform_json(json_hash, target)
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
      result['replaces'] = json_hash['replaces'].map { |var| Reference.transform_json(var) } unless json_hash['replaces'].nil?
      result['requisition'] = Identifier.transform_json(json_hash['requisition']) unless json_hash['requisition'].nil?      
      result['status'] = ServiceRequestStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['intent'] = ServiceRequestIntent.transform_json(json_hash['intent']) unless json_hash['intent'].nil?      
      result['category'] = json_hash['category'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['category'].nil?
      result['priority'] = ServiceRequestPriority.transform_json(json_hash['priority']) unless json_hash['priority'].nil?      
      result['doNotPerform'] = PrimitiveBoolean.transform_json(json_hash['doNotPerform'], json_hash['_doNotPerform']) unless json_hash['doNotPerform'].nil?      
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?      
      result['orderDetail'] = json_hash['orderDetail'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['orderDetail'].nil?
      result['quantityQuantity'] = Quantity.transform_json(json_hash['quantityQuantity']) unless json_hash['quantityQuantity'].nil?      
      result['quantityRatio'] = Ratio.transform_json(json_hash['quantityRatio']) unless json_hash['quantityRatio'].nil?      
      result['quantityRange'] = Range.transform_json(json_hash['quantityRange']) unless json_hash['quantityRange'].nil?      
      result['subject'] = Reference.transform_json(json_hash['subject']) unless json_hash['subject'].nil?      
      result['encounter'] = Reference.transform_json(json_hash['encounter']) unless json_hash['encounter'].nil?      
      result['occurrenceDateTime'] = PrimitiveDateTime.transform_json(json_hash['occurrenceDateTime'], json_hash['_occurrenceDateTime']) unless json_hash['occurrenceDateTime'].nil?      
      result['occurrencePeriod'] = Period.transform_json(json_hash['occurrencePeriod']) unless json_hash['occurrencePeriod'].nil?      
      result['occurrenceTiming'] = Timing.transform_json(json_hash['occurrenceTiming']) unless json_hash['occurrenceTiming'].nil?      
      result['asNeededBoolean'] = PrimitiveBoolean.transform_json(json_hash['asNeededBoolean'], json_hash['_asNeededBoolean']) unless json_hash['asNeededBoolean'].nil?      
      result['asNeededCodeableConcept'] = CodeableConcept.transform_json(json_hash['asNeededCodeableConcept']) unless json_hash['asNeededCodeableConcept'].nil?      
      result['authoredOn'] = PrimitiveDateTime.transform_json(json_hash['authoredOn'], json_hash['_authoredOn']) unless json_hash['authoredOn'].nil?      
      result['requester'] = Reference.transform_json(json_hash['requester']) unless json_hash['requester'].nil?      
      result['performerType'] = CodeableConcept.transform_json(json_hash['performerType']) unless json_hash['performerType'].nil?      
      result['performer'] = json_hash['performer'].map { |var| Reference.transform_json(var) } unless json_hash['performer'].nil?
      result['locationCode'] = json_hash['locationCode'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['locationCode'].nil?
      result['locationReference'] = json_hash['locationReference'].map { |var| Reference.transform_json(var) } unless json_hash['locationReference'].nil?
      result['reasonCode'] = json_hash['reasonCode'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['reasonCode'].nil?
      result['reasonReference'] = json_hash['reasonReference'].map { |var| Reference.transform_json(var) } unless json_hash['reasonReference'].nil?
      result['insurance'] = json_hash['insurance'].map { |var| Reference.transform_json(var) } unless json_hash['insurance'].nil?
      result['supportingInfo'] = json_hash['supportingInfo'].map { |var| Reference.transform_json(var) } unless json_hash['supportingInfo'].nil?
      result['specimen'] = json_hash['specimen'].map { |var| Reference.transform_json(var) } unless json_hash['specimen'].nil?
      result['bodySite'] = json_hash['bodySite'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['bodySite'].nil?
      result['note'] = json_hash['note'].map { |var| Annotation.transform_json(var) } unless json_hash['note'].nil?
      result['patientInstruction'] = PrimitiveString.transform_json(json_hash['patientInstruction'], json_hash['_patientInstruction']) unless json_hash['patientInstruction'].nil?      
      result['relevantHistory'] = json_hash['relevantHistory'].map { |var| Reference.transform_json(var) } unless json_hash['relevantHistory'].nil?

      result
    end
  end
end
