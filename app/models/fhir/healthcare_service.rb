module FHIR
  # fhir/healthcare_service.rb
  class HealthcareService < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :active, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :providedBy, class_name: 'FHIR::Reference'    
    embeds_many :category, class_name: 'FHIR::CodeableConcept'    
    embeds_many :type, class_name: 'FHIR::CodeableConcept'    
    embeds_many :specialty, class_name: 'FHIR::CodeableConcept'    
    embeds_many :location, class_name: 'FHIR::Reference'    
    embeds_one :name, class_name: 'FHIR::PrimitiveString'    
    embeds_one :comment, class_name: 'FHIR::PrimitiveString'    
    embeds_one :extraDetails, class_name: 'FHIR::PrimitiveMarkdown'    
    embeds_one :photo, class_name: 'FHIR::Attachment'    
    embeds_many :telecom, class_name: 'FHIR::ContactPoint'    
    embeds_many :coverageArea, class_name: 'FHIR::Reference'    
    embeds_many :serviceProvisionCode, class_name: 'FHIR::CodeableConcept'    
    embeds_many :eligibility, class_name: 'FHIR::HealthcareServiceEligibility'    
    embeds_many :program, class_name: 'FHIR::CodeableConcept'    
    embeds_many :characteristic, class_name: 'FHIR::CodeableConcept'    
    embeds_many :communication, class_name: 'FHIR::CodeableConcept'    
    embeds_many :referralMethod, class_name: 'FHIR::CodeableConcept'    
    embeds_one :appointmentRequired, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_many :availableTime, class_name: 'FHIR::HealthcareServiceAvailableTime'    
    embeds_many :notAvailable, class_name: 'FHIR::HealthcareServiceNotAvailable'    
    embeds_one :availabilityExceptions, class_name: 'FHIR::PrimitiveString'    
    embeds_many :endpoint, class_name: 'FHIR::Reference'    

    def self.transform_json(json_hash, target = HealthcareService.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['active'] = PrimitiveBoolean.transform_json(json_hash['active'], json_hash['_active']) unless json_hash['active'].nil?
      result['providedBy'] = Reference.transform_json(json_hash['providedBy']) unless json_hash['providedBy'].nil?
      result['category'] = json_hash['category'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['category'].nil?
      result['type'] = json_hash['type'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['type'].nil?
      result['specialty'] = json_hash['specialty'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['specialty'].nil?
      result['location'] = json_hash['location'].map { |var| Reference.transform_json(var) } unless json_hash['location'].nil?
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?
      result['comment'] = PrimitiveString.transform_json(json_hash['comment'], json_hash['_comment']) unless json_hash['comment'].nil?
      result['extraDetails'] = PrimitiveMarkdown.transform_json(json_hash['extraDetails'], json_hash['_extraDetails']) unless json_hash['extraDetails'].nil?
      result['photo'] = Attachment.transform_json(json_hash['photo']) unless json_hash['photo'].nil?
      result['telecom'] = json_hash['telecom'].map { |var| ContactPoint.transform_json(var) } unless json_hash['telecom'].nil?
      result['coverageArea'] = json_hash['coverageArea'].map { |var| Reference.transform_json(var) } unless json_hash['coverageArea'].nil?
      result['serviceProvisionCode'] = json_hash['serviceProvisionCode'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['serviceProvisionCode'].nil?
      result['eligibility'] = json_hash['eligibility'].map { |var| HealthcareServiceEligibility.transform_json(var) } unless json_hash['eligibility'].nil?
      result['program'] = json_hash['program'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['program'].nil?
      result['characteristic'] = json_hash['characteristic'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['characteristic'].nil?
      result['communication'] = json_hash['communication'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['communication'].nil?
      result['referralMethod'] = json_hash['referralMethod'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['referralMethod'].nil?
      result['appointmentRequired'] = PrimitiveBoolean.transform_json(json_hash['appointmentRequired'], json_hash['_appointmentRequired']) unless json_hash['appointmentRequired'].nil?
      result['availableTime'] = json_hash['availableTime'].map { |var| HealthcareServiceAvailableTime.transform_json(var) } unless json_hash['availableTime'].nil?
      result['notAvailable'] = json_hash['notAvailable'].map { |var| HealthcareServiceNotAvailable.transform_json(var) } unless json_hash['notAvailable'].nil?
      result['availabilityExceptions'] = PrimitiveString.transform_json(json_hash['availabilityExceptions'], json_hash['_availabilityExceptions']) unless json_hash['availabilityExceptions'].nil?
      result['endpoint'] = json_hash['endpoint'].map { |var| Reference.transform_json(var) } unless json_hash['endpoint'].nil?

      result
    end
  end
end
