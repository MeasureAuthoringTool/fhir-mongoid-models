module FHIR
  # fhir/effect_evidence_synthesis.rb
  class EffectEvidenceSynthesis < DomainResource
    include Mongoid::Document
    embeds_one :url, class_name: 'FHIR::PrimitiveUri'
    embeds_many :identifier, class_name: 'FHIR::Identifier'
    embeds_one :version, class_name: 'FHIR::PrimitiveString'
    embeds_one :name, class_name: 'FHIR::PrimitiveString'
    embeds_one :title, class_name: 'FHIR::PrimitiveString'
    embeds_one :status, class_name: 'FHIR::PublicationStatus'
    embeds_one :date, class_name: 'FHIR::PrimitiveDateTime'
    embeds_one :publisher, class_name: 'FHIR::PrimitiveString'
    embeds_many :contact, class_name: 'FHIR::ContactDetail'
    embeds_one :description, class_name: 'FHIR::PrimitiveMarkdown'
    embeds_many :note, class_name: 'FHIR::Annotation'
    embeds_many :useContext, class_name: 'FHIR::UsageContext'
    embeds_many :jurisdiction, class_name: 'FHIR::CodeableConcept'
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
    embeds_one :synthesisType, class_name: 'FHIR::CodeableConcept'
    embeds_one :studyType, class_name: 'FHIR::CodeableConcept'
    embeds_one :population, class_name: 'FHIR::Reference'
    embeds_one :exposure, class_name: 'FHIR::Reference'
    embeds_one :exposureAlternative, class_name: 'FHIR::Reference'
    embeds_one :outcome, class_name: 'FHIR::Reference'
    embeds_one :sampleSize, class_name: 'FHIR::EffectEvidenceSynthesisSampleSize'
    embeds_many :resultsByExposure, class_name: 'FHIR::EffectEvidenceSynthesisResultsByExposure'
    embeds_many :effectEstimate, class_name: 'FHIR::EffectEvidenceSynthesisEffectEstimate'
    embeds_many :certainty, class_name: 'FHIR::EffectEvidenceSynthesisCertainty'

    def self.transform_json(json_hash, target = EffectEvidenceSynthesis.new)
      result = self.superclass.transform_json(json_hash, target)
      result['url'] = PrimitiveUri.transform_json(json_hash['url'], json_hash['_url']) unless json_hash['url'].nil?      
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['version'] = PrimitiveString.transform_json(json_hash['version'], json_hash['_version']) unless json_hash['version'].nil?      
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?      
      result['title'] = PrimitiveString.transform_json(json_hash['title'], json_hash['_title']) unless json_hash['title'].nil?      
      result['status'] = PublicationStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['date'] = PrimitiveDateTime.transform_json(json_hash['date'], json_hash['_date']) unless json_hash['date'].nil?      
      result['publisher'] = PrimitiveString.transform_json(json_hash['publisher'], json_hash['_publisher']) unless json_hash['publisher'].nil?      
      result['contact'] = json_hash['contact'].map { |var| ContactDetail.transform_json(var) } unless json_hash['contact'].nil?
      result['description'] = PrimitiveMarkdown.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['note'] = json_hash['note'].map { |var| Annotation.transform_json(var) } unless json_hash['note'].nil?
      result['useContext'] = json_hash['useContext'].map { |var| UsageContext.transform_json(var) } unless json_hash['useContext'].nil?
      result['jurisdiction'] = json_hash['jurisdiction'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['jurisdiction'].nil?
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
      result['synthesisType'] = CodeableConcept.transform_json(json_hash['synthesisType']) unless json_hash['synthesisType'].nil?      
      result['studyType'] = CodeableConcept.transform_json(json_hash['studyType']) unless json_hash['studyType'].nil?      
      result['population'] = Reference.transform_json(json_hash['population']) unless json_hash['population'].nil?      
      result['exposure'] = Reference.transform_json(json_hash['exposure']) unless json_hash['exposure'].nil?      
      result['exposureAlternative'] = Reference.transform_json(json_hash['exposureAlternative']) unless json_hash['exposureAlternative'].nil?      
      result['outcome'] = Reference.transform_json(json_hash['outcome']) unless json_hash['outcome'].nil?      
      result['sampleSize'] = EffectEvidenceSynthesisSampleSize.transform_json(json_hash['sampleSize']) unless json_hash['sampleSize'].nil?      
      result['resultsByExposure'] = json_hash['resultsByExposure'].map { |var| EffectEvidenceSynthesisResultsByExposure.transform_json(var) } unless json_hash['resultsByExposure'].nil?
      result['effectEstimate'] = json_hash['effectEstimate'].map { |var| EffectEvidenceSynthesisEffectEstimate.transform_json(var) } unless json_hash['effectEstimate'].nil?
      result['certainty'] = json_hash['certainty'].map { |var| EffectEvidenceSynthesisCertainty.transform_json(var) } unless json_hash['certainty'].nil?

      result
    end
  end
end
