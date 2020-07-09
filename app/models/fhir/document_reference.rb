module FHIR
  # fhir/document_reference.rb
  class DocumentReference < DomainResource
    include Mongoid::Document
    embeds_one :masterIdentifier, class_name: 'FHIR::Identifier'
    embeds_many :identifier, class_name: 'FHIR::Identifier'
    embeds_one :status, class_name: 'FHIR::DocumentReferenceStatus'
    embeds_one :docStatus, class_name: 'FHIR::ReferredDocumentStatus'
    embeds_one :type, class_name: 'FHIR::CodeableConcept'
    embeds_many :category, class_name: 'FHIR::CodeableConcept'
    embeds_one :subject, class_name: 'FHIR::Reference'
    embeds_one :date, class_name: 'FHIR::PrimitiveInstant'
    embeds_many :author, class_name: 'FHIR::Reference'
    embeds_one :authenticator, class_name: 'FHIR::Reference'
    embeds_one :custodian, class_name: 'FHIR::Reference'
    embeds_many :relatesTo, class_name: 'FHIR::DocumentReferenceRelatesTo'
    embeds_one :description, class_name: 'FHIR::PrimitiveString'
    embeds_many :securityLabel, class_name: 'FHIR::CodeableConcept'
    embeds_many :content, class_name: 'FHIR::DocumentReferenceContent'
    embeds_one :context, class_name: 'FHIR::DocumentReferenceContext'

    def self.transform_json(json_hash, target = DocumentReference.new)
      result = self.superclass.transform_json(json_hash, target)
      result['masterIdentifier'] = Identifier.transform_json(json_hash['masterIdentifier']) unless json_hash['masterIdentifier'].nil?      
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['status'] = DocumentReferenceStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['docStatus'] = ReferredDocumentStatus.transform_json(json_hash['docStatus']) unless json_hash['docStatus'].nil?      
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['category'] = json_hash['category'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['category'].nil?
      result['subject'] = Reference.transform_json(json_hash['subject']) unless json_hash['subject'].nil?      
      result['date'] = PrimitiveInstant.transform_json(json_hash['date'], json_hash['_date']) unless json_hash['date'].nil?      
      result['author'] = json_hash['author'].map { |var| Reference.transform_json(var) } unless json_hash['author'].nil?
      result['authenticator'] = Reference.transform_json(json_hash['authenticator']) unless json_hash['authenticator'].nil?      
      result['custodian'] = Reference.transform_json(json_hash['custodian']) unless json_hash['custodian'].nil?      
      result['relatesTo'] = json_hash['relatesTo'].map { |var| DocumentReferenceRelatesTo.transform_json(var) } unless json_hash['relatesTo'].nil?
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['securityLabel'] = json_hash['securityLabel'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['securityLabel'].nil?
      result['content'] = json_hash['content'].map { |var| DocumentReferenceContent.transform_json(var) } unless json_hash['content'].nil?
      result['context'] = DocumentReferenceContext.transform_json(json_hash['context']) unless json_hash['context'].nil?      

      result
    end
  end
end
