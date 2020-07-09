module FHIR
  # fhir/document_manifest.rb
  class DocumentManifest < DomainResource
    include Mongoid::Document
    embeds_one :masterIdentifier, class_name: 'FHIR::Identifier'
    embeds_many :identifier, class_name: 'FHIR::Identifier'
    embeds_one :status, class_name: 'FHIR::DocumentReferenceStatus'
    embeds_one :type, class_name: 'FHIR::CodeableConcept'
    embeds_one :subject, class_name: 'FHIR::Reference'
    embeds_one :created, class_name: 'FHIR::PrimitiveDateTime'
    embeds_many :author, class_name: 'FHIR::Reference'
    embeds_many :recipient, class_name: 'FHIR::Reference'
    embeds_one :source, class_name: 'FHIR::PrimitiveUri'
    embeds_one :description, class_name: 'FHIR::PrimitiveString'
    embeds_many :content, class_name: 'FHIR::Reference'
    embeds_many :related, class_name: 'FHIR::DocumentManifestRelated'

    def self.transform_json(json_hash, target = DocumentManifest.new)
      result = self.superclass.transform_json(json_hash, target)
      result['masterIdentifier'] = Identifier.transform_json(json_hash['masterIdentifier']) unless json_hash['masterIdentifier'].nil?      
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['status'] = DocumentReferenceStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['subject'] = Reference.transform_json(json_hash['subject']) unless json_hash['subject'].nil?      
      result['created'] = PrimitiveDateTime.transform_json(json_hash['created'], json_hash['_created']) unless json_hash['created'].nil?      
      result['author'] = json_hash['author'].map { |var| Reference.transform_json(var) } unless json_hash['author'].nil?
      result['recipient'] = json_hash['recipient'].map { |var| Reference.transform_json(var) } unless json_hash['recipient'].nil?
      result['source'] = PrimitiveUri.transform_json(json_hash['source'], json_hash['_source']) unless json_hash['source'].nil?      
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['content'] = json_hash['content'].map { |var| Reference.transform_json(var) } unless json_hash['content'].nil?
      result['related'] = json_hash['related'].map { |var| DocumentManifestRelated.transform_json(var) } unless json_hash['related'].nil?

      result
    end
  end
end
