module FHIR
  # fhir/immunization.rb
  class Immunization < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'
    embeds_one :status, class_name: 'FHIR::ImmunizationStatus'
    embeds_one :statusReason, class_name: 'FHIR::CodeableConcept'
    embeds_one :vaccineCode, class_name: 'FHIR::CodeableConcept'
    embeds_one :patient, class_name: 'FHIR::Reference'
    embeds_one :encounter, class_name: 'FHIR::Reference'
    embeds_one :occurrenceDateTime, class_name: 'FHIR::PrimitiveDateTime'
    embeds_one :occurrenceString, class_name: 'FHIR::PrimitiveString'
    embeds_one :recorded, class_name: 'FHIR::PrimitiveDateTime'
    embeds_one :primarySource, class_name: 'FHIR::PrimitiveBoolean'
    embeds_one :reportOrigin, class_name: 'FHIR::CodeableConcept'
    embeds_one :location, class_name: 'FHIR::Reference'
    embeds_one :manufacturer, class_name: 'FHIR::Reference'
    embeds_one :lotNumber, class_name: 'FHIR::PrimitiveString'
    embeds_one :expirationDate, class_name: 'FHIR::PrimitiveDate'
    embeds_one :site, class_name: 'FHIR::CodeableConcept'
    embeds_one :route, class_name: 'FHIR::CodeableConcept'
    embeds_one :doseQuantity, class_name: 'FHIR::SimpleQuantity'
    embeds_many :performer, class_name: 'FHIR::ImmunizationPerformer'
    embeds_many :note, class_name: 'FHIR::Annotation'
    embeds_many :reasonCode, class_name: 'FHIR::CodeableConcept'
    embeds_many :reasonReference, class_name: 'FHIR::Reference'
    embeds_one :isSubpotent, class_name: 'FHIR::PrimitiveBoolean'
    embeds_many :subpotentReason, class_name: 'FHIR::CodeableConcept'
    embeds_many :education, class_name: 'FHIR::ImmunizationEducation'
    embeds_many :programEligibility, class_name: 'FHIR::CodeableConcept'
    embeds_one :fundingSource, class_name: 'FHIR::CodeableConcept'
    embeds_many :reaction, class_name: 'FHIR::ImmunizationReaction'
    embeds_many :protocolApplied, class_name: 'FHIR::ImmunizationProtocolApplied'

    def self.transform_json(json_hash, target = Immunization.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['status'] = ImmunizationStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['statusReason'] = CodeableConcept.transform_json(json_hash['statusReason']) unless json_hash['statusReason'].nil?      
      result['vaccineCode'] = CodeableConcept.transform_json(json_hash['vaccineCode']) unless json_hash['vaccineCode'].nil?      
      result['patient'] = Reference.transform_json(json_hash['patient']) unless json_hash['patient'].nil?      
      result['encounter'] = Reference.transform_json(json_hash['encounter']) unless json_hash['encounter'].nil?      
      result['occurrenceDateTime'] = PrimitiveDateTime.transform_json(json_hash['occurrenceDateTime'], json_hash['_occurrenceDateTime']) unless json_hash['occurrenceDateTime'].nil?      
      result['occurrenceString'] = PrimitiveString.transform_json(json_hash['occurrenceString'], json_hash['_occurrenceString']) unless json_hash['occurrenceString'].nil?      
      result['recorded'] = PrimitiveDateTime.transform_json(json_hash['recorded'], json_hash['_recorded']) unless json_hash['recorded'].nil?      
      result['primarySource'] = PrimitiveBoolean.transform_json(json_hash['primarySource'], json_hash['_primarySource']) unless json_hash['primarySource'].nil?      
      result['reportOrigin'] = CodeableConcept.transform_json(json_hash['reportOrigin']) unless json_hash['reportOrigin'].nil?      
      result['location'] = Reference.transform_json(json_hash['location']) unless json_hash['location'].nil?      
      result['manufacturer'] = Reference.transform_json(json_hash['manufacturer']) unless json_hash['manufacturer'].nil?      
      result['lotNumber'] = PrimitiveString.transform_json(json_hash['lotNumber'], json_hash['_lotNumber']) unless json_hash['lotNumber'].nil?      
      result['expirationDate'] = PrimitiveDate.transform_json(json_hash['expirationDate'], json_hash['_expirationDate']) unless json_hash['expirationDate'].nil?      
      result['site'] = CodeableConcept.transform_json(json_hash['site']) unless json_hash['site'].nil?      
      result['route'] = CodeableConcept.transform_json(json_hash['route']) unless json_hash['route'].nil?      
      result['doseQuantity'] = SimpleQuantity.transform_json(json_hash['doseQuantity']) unless json_hash['doseQuantity'].nil?      
      result['performer'] = json_hash['performer'].map { |var| ImmunizationPerformer.transform_json(var) } unless json_hash['performer'].nil?
      result['note'] = json_hash['note'].map { |var| Annotation.transform_json(var) } unless json_hash['note'].nil?
      result['reasonCode'] = json_hash['reasonCode'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['reasonCode'].nil?
      result['reasonReference'] = json_hash['reasonReference'].map { |var| Reference.transform_json(var) } unless json_hash['reasonReference'].nil?
      result['isSubpotent'] = PrimitiveBoolean.transform_json(json_hash['isSubpotent'], json_hash['_isSubpotent']) unless json_hash['isSubpotent'].nil?      
      result['subpotentReason'] = json_hash['subpotentReason'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['subpotentReason'].nil?
      result['education'] = json_hash['education'].map { |var| ImmunizationEducation.transform_json(var) } unless json_hash['education'].nil?
      result['programEligibility'] = json_hash['programEligibility'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['programEligibility'].nil?
      result['fundingSource'] = CodeableConcept.transform_json(json_hash['fundingSource']) unless json_hash['fundingSource'].nil?      
      result['reaction'] = json_hash['reaction'].map { |var| ImmunizationReaction.transform_json(var) } unless json_hash['reaction'].nil?
      result['protocolApplied'] = json_hash['protocolApplied'].map { |var| ImmunizationProtocolApplied.transform_json(var) } unless json_hash['protocolApplied'].nil?

      result
    end
  end
end
