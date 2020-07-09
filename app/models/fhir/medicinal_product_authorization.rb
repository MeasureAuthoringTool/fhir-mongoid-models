module FHIR
  # fhir/medicinal_product_authorization.rb
  class MedicinalProductAuthorization < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'
    embeds_one :subject, class_name: 'FHIR::Reference'
    embeds_many :country, class_name: 'FHIR::CodeableConcept'
    embeds_many :jurisdiction, class_name: 'FHIR::CodeableConcept'
    embeds_one :status, class_name: 'FHIR::CodeableConcept'
    embeds_one :statusDate, class_name: 'FHIR::PrimitiveDateTime'
    embeds_one :restoreDate, class_name: 'FHIR::PrimitiveDateTime'
    embeds_one :validityPeriod, class_name: 'FHIR::Period'
    embeds_one :dataExclusivityPeriod, class_name: 'FHIR::Period'
    embeds_one :dateOfFirstAuthorization, class_name: 'FHIR::PrimitiveDateTime'
    embeds_one :internationalBirthDate, class_name: 'FHIR::PrimitiveDateTime'
    embeds_one :legalBasis, class_name: 'FHIR::CodeableConcept'
    embeds_many :jurisdictionalAuthorization, class_name: 'FHIR::MedicinalProductAuthorizationJurisdictionalAuthorization'
    embeds_one :holder, class_name: 'FHIR::Reference'
    embeds_one :regulator, class_name: 'FHIR::Reference'
    embeds_one :procedure, class_name: 'FHIR::MedicinalProductAuthorizationProcedure'

    def self.transform_json(json_hash, target = MedicinalProductAuthorization.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['subject'] = Reference.transform_json(json_hash['subject']) unless json_hash['subject'].nil?      
      result['country'] = json_hash['country'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['country'].nil?
      result['jurisdiction'] = json_hash['jurisdiction'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['jurisdiction'].nil?
      result['status'] = CodeableConcept.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['statusDate'] = PrimitiveDateTime.transform_json(json_hash['statusDate'], json_hash['_statusDate']) unless json_hash['statusDate'].nil?      
      result['restoreDate'] = PrimitiveDateTime.transform_json(json_hash['restoreDate'], json_hash['_restoreDate']) unless json_hash['restoreDate'].nil?      
      result['validityPeriod'] = Period.transform_json(json_hash['validityPeriod']) unless json_hash['validityPeriod'].nil?      
      result['dataExclusivityPeriod'] = Period.transform_json(json_hash['dataExclusivityPeriod']) unless json_hash['dataExclusivityPeriod'].nil?      
      result['dateOfFirstAuthorization'] = PrimitiveDateTime.transform_json(json_hash['dateOfFirstAuthorization'], json_hash['_dateOfFirstAuthorization']) unless json_hash['dateOfFirstAuthorization'].nil?      
      result['internationalBirthDate'] = PrimitiveDateTime.transform_json(json_hash['internationalBirthDate'], json_hash['_internationalBirthDate']) unless json_hash['internationalBirthDate'].nil?      
      result['legalBasis'] = CodeableConcept.transform_json(json_hash['legalBasis']) unless json_hash['legalBasis'].nil?      
      result['jurisdictionalAuthorization'] = json_hash['jurisdictionalAuthorization'].map { |var| MedicinalProductAuthorizationJurisdictionalAuthorization.transform_json(var) } unless json_hash['jurisdictionalAuthorization'].nil?
      result['holder'] = Reference.transform_json(json_hash['holder']) unless json_hash['holder'].nil?      
      result['regulator'] = Reference.transform_json(json_hash['regulator']) unless json_hash['regulator'].nil?      
      result['procedure'] = MedicinalProductAuthorizationProcedure.transform_json(json_hash['procedure']) unless json_hash['procedure'].nil?      

      result
    end
  end
end
