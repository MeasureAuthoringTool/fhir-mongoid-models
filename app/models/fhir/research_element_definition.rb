module FHIR
  # fhir/research_element_definition.rb
  class ResearchElementDefinition < DomainResource
    include Mongoid::Document
    embeds_one :url, class_name: 'FHIR::PrimitiveUri'    
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :version, class_name: 'FHIR::PrimitiveString'    
    embeds_one :name, class_name: 'FHIR::PrimitiveString'    
    embeds_one :title, class_name: 'FHIR::PrimitiveString'    
    embeds_one :shortTitle, class_name: 'FHIR::PrimitiveString'    
    embeds_one :subtitle, class_name: 'FHIR::PrimitiveString'    
    embeds_one :status, class_name: 'FHIR::PublicationStatus'    
    embeds_one :experimental, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :subjectCodeableConcept, class_name: 'FHIR::CodeableConcept'    
    embeds_one :subjectReference, class_name: 'FHIR::Reference'    
    embeds_one :date, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :publisher, class_name: 'FHIR::PrimitiveString'    
    embeds_many :contact, class_name: 'FHIR::ContactDetail'    
    embeds_one :description, class_name: 'FHIR::PrimitiveMarkdown'    
    embeds_many :comment, class_name: 'FHIR::PrimitiveString'    
    embeds_many :useContext, class_name: 'FHIR::UsageContext'    
    embeds_many :jurisdiction, class_name: 'FHIR::CodeableConcept'    
    embeds_one :purpose, class_name: 'FHIR::PrimitiveMarkdown'    
    embeds_one :usage, class_name: 'FHIR::PrimitiveString'    
    embeds_one :copyright, class_name: 'FHIR::PrimitiveMarkdown'    
    embeds_one :approvalDate, class_name: 'FHIR::PrimitiveDate'    
    embeds_one :lastReviewDate, class_name: 'FHIR::PrimitiveDate'    
    embeds_one :effectivePeriod, class_name: 'FHIR::Period'    
    embeds_many :topic, class_name: 'FHIR::CodeableConcept'    
    embeds_many :author, class_name: 'FHIR::ContactDetail'    
    embeds_many :editor, class_name: 'FHIR::ContactDetail'    
    embeds_many :reviewer, class_name: 'FHIR::ContactDetail'    
    embeds_many :endorser, class_name: 'FHIR::ContactDetail'    
    embeds_many :relatedArtifact, class_name: 'FHIR::RelatedArtifact'    
    embeds_many :library, class_name: 'FHIR::PrimitiveCanonical'    
    embeds_one :type, class_name: 'FHIR::ResearchElementType'    
    embeds_one :variableType, class_name: 'FHIR::VariableType'    
    embeds_many :characteristic, class_name: 'FHIR::ResearchElementDefinitionCharacteristic'    

    def self.transform_json(json_hash, target = ResearchElementDefinition.new)
      result = self.superclass.transform_json(json_hash, target)
      result['url'] = PrimitiveUri.transform_json(json_hash['url'], json_hash['_url']) unless json_hash['url'].nil?
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['version'] = PrimitiveString.transform_json(json_hash['version'], json_hash['_version']) unless json_hash['version'].nil?
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?
      result['title'] = PrimitiveString.transform_json(json_hash['title'], json_hash['_title']) unless json_hash['title'].nil?
      result['shortTitle'] = PrimitiveString.transform_json(json_hash['shortTitle'], json_hash['_shortTitle']) unless json_hash['shortTitle'].nil?
      result['subtitle'] = PrimitiveString.transform_json(json_hash['subtitle'], json_hash['_subtitle']) unless json_hash['subtitle'].nil?
      result['status'] = PublicationStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?
      result['experimental'] = PrimitiveBoolean.transform_json(json_hash['experimental'], json_hash['_experimental']) unless json_hash['experimental'].nil?
      result['subjectCodeableConcept'] = CodeableConcept.transform_json(json_hash['subjectCodeableConcept']) unless json_hash['subjectCodeableConcept'].nil?
      result['subjectReference'] = Reference.transform_json(json_hash['subjectReference']) unless json_hash['subjectReference'].nil?
      result['date'] = PrimitiveDateTime.transform_json(json_hash['date'], json_hash['_date']) unless json_hash['date'].nil?
      result['publisher'] = PrimitiveString.transform_json(json_hash['publisher'], json_hash['_publisher']) unless json_hash['publisher'].nil?
      result['contact'] = json_hash['contact'].map { |var| ContactDetail.transform_json(var) } unless json_hash['contact'].nil?
      result['description'] = PrimitiveMarkdown.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['comment'] = json_hash['comment'].each_with_index.map do |var, i|
        extension_hash = json_hash['_comment'] && json_hash['_comment'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['comment'].nil?
      result['useContext'] = json_hash['useContext'].map { |var| UsageContext.transform_json(var) } unless json_hash['useContext'].nil?
      result['jurisdiction'] = json_hash['jurisdiction'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['jurisdiction'].nil?
      result['purpose'] = PrimitiveMarkdown.transform_json(json_hash['purpose'], json_hash['_purpose']) unless json_hash['purpose'].nil?
      result['usage'] = PrimitiveString.transform_json(json_hash['usage'], json_hash['_usage']) unless json_hash['usage'].nil?
      result['copyright'] = PrimitiveMarkdown.transform_json(json_hash['copyright'], json_hash['_copyright']) unless json_hash['copyright'].nil?
      result['approvalDate'] = PrimitiveDate.transform_json(json_hash['approvalDate'], json_hash['_approvalDate']) unless json_hash['approvalDate'].nil?
      result['lastReviewDate'] = PrimitiveDate.transform_json(json_hash['lastReviewDate'], json_hash['_lastReviewDate']) unless json_hash['lastReviewDate'].nil?
      result['effectivePeriod'] = Period.transform_json(json_hash['effectivePeriod']) unless json_hash['effectivePeriod'].nil?
      result['topic'] = json_hash['topic'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['topic'].nil?
      result['author'] = json_hash['author'].map { |var| ContactDetail.transform_json(var) } unless json_hash['author'].nil?
      result['editor'] = json_hash['editor'].map { |var| ContactDetail.transform_json(var) } unless json_hash['editor'].nil?
      result['reviewer'] = json_hash['reviewer'].map { |var| ContactDetail.transform_json(var) } unless json_hash['reviewer'].nil?
      result['endorser'] = json_hash['endorser'].map { |var| ContactDetail.transform_json(var) } unless json_hash['endorser'].nil?
      result['relatedArtifact'] = json_hash['relatedArtifact'].map { |var| RelatedArtifact.transform_json(var) } unless json_hash['relatedArtifact'].nil?
      result['library'] = json_hash['library'].each_with_index.map do |var, i|
        extension_hash = json_hash['_library'] && json_hash['_library'][i]
        PrimitiveCanonical.transform_json(var, extension_hash)
      end unless json_hash['library'].nil?
      result['type'] = ResearchElementType.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['variableType'] = VariableType.transform_json(json_hash['variableType']) unless json_hash['variableType'].nil?
      result['characteristic'] = json_hash['characteristic'].map { |var| ResearchElementDefinitionCharacteristic.transform_json(var) } unless json_hash['characteristic'].nil?

      result
    end
  end
end
