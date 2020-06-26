module FHIR
  # fhir/document_reference.rb
  class DocumentReference < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'DocumentReference'
    embeds_one :masterIdentifier, class_name: 'Identifier'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'DocumentReferenceStatus'
    embeds_one :docStatus, class_name: 'ReferredDocumentStatus'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_many :category, class_name: 'CodeableConcept'
    embeds_one :subject, class_name: 'Reference'
    embeds_one :date, class_name: 'PrimitiveInstant'
    embeds_many :author, class_name: 'Reference'
    embeds_one :authenticator, class_name: 'Reference'
    embeds_one :custodian, class_name: 'Reference'
    embeds_many :relatesTo, class_name: 'DocumentReferenceRelatesTo'
    embeds_one :description, class_name: 'PrimitiveString'
    embeds_many :securityLabel, class_name: 'CodeableConcept'
    embeds_many :content, class_name: 'DocumentReferenceContent'
    embeds_one :context, class_name: 'DocumentReferenceContext'

    def self.transform_json(json_hash)
      result = DocumentReference.new
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
