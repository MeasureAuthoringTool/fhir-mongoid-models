module FHIR
  # fhir/activity_definition.rb
  class ActivityDefinition < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'ActivityDefinition'
    embeds_one :url, class_name: 'PrimitiveUri'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :version, class_name: 'PrimitiveString'
    embeds_one :name, class_name: 'PrimitiveString'
    embeds_one :title, class_name: 'PrimitiveString'
    embeds_one :subtitle, class_name: 'PrimitiveString'
    embeds_one :status, class_name: 'PublicationStatus'
    embeds_one :experimental, class_name: 'PrimitiveBoolean'
    embeds_one :subjectCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :subjectReference, class_name: 'Reference'
    embeds_one :date, class_name: 'PrimitiveDateTime'
    embeds_one :publisher, class_name: 'PrimitiveString'
    embeds_many :contact, class_name: 'ContactDetail'
    embeds_one :description, class_name: 'PrimitiveMarkdown'
    embeds_many :useContext, class_name: 'UsageContext'
    embeds_many :jurisdiction, class_name: 'CodeableConcept'
    embeds_one :purpose, class_name: 'PrimitiveMarkdown'
    embeds_one :usage, class_name: 'PrimitiveString'
    embeds_one :copyright, class_name: 'PrimitiveMarkdown'
    embeds_one :approvalDate, class_name: 'PrimitiveDate'
    embeds_one :lastReviewDate, class_name: 'PrimitiveDate'
    embeds_one :effectivePeriod, class_name: 'Period'
    embeds_many :topic, class_name: 'CodeableConcept'
    embeds_many :author, class_name: 'ContactDetail'
    embeds_many :editor, class_name: 'ContactDetail'
    embeds_many :reviewer, class_name: 'ContactDetail'
    embeds_many :endorser, class_name: 'ContactDetail'
    embeds_many :relatedArtifact, class_name: 'RelatedArtifact'
    embeds_many :library, class_name: 'PrimitiveCanonical'
    embeds_one :kind, class_name: 'ActivityDefinitionKind'
    embeds_one :profile, class_name: 'PrimitiveCanonical'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_one :intent, class_name: 'RequestIntent'
    embeds_one :priority, class_name: 'RequestPriority'
    embeds_one :doNotPerform, class_name: 'PrimitiveBoolean'
    embeds_one :timingTiming, class_name: 'Timing'
    embeds_one :timingDateTime, class_name: 'PrimitiveDateTime'
    embeds_one :timingAge, class_name: 'Age'
    embeds_one :timingPeriod, class_name: 'Period'
    embeds_one :timingRange, class_name: 'Range'
    embeds_one :timingDuration, class_name: 'Duration'
    embeds_one :location, class_name: 'Reference'
    embeds_many :participant, class_name: 'ActivityDefinitionParticipant'
    embeds_one :productReference, class_name: 'Reference'
    embeds_one :productCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :quantity, class_name: 'SimpleQuantity'
    embeds_many :dosage, class_name: 'Dosage'
    embeds_many :bodySite, class_name: 'CodeableConcept'
    embeds_many :specimenRequirement, class_name: 'Reference'
    embeds_many :observationRequirement, class_name: 'Reference'
    embeds_many :observationResultRequirement, class_name: 'Reference'
    embeds_one :transform, class_name: 'PrimitiveCanonical'
    embeds_many :dynamicValue, class_name: 'ActivityDefinitionDynamicValue'

    def self.transform_json(json_hash, target=ActivityDefinition.new)
      result = self.superclass.transform_json(json_hash, target)
      result['url'] = PrimitiveUri.transform_json(json_hash['url'], json_hash['_url']) unless json_hash['url'].nil?      
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['version'] = PrimitiveString.transform_json(json_hash['version'], json_hash['_version']) unless json_hash['version'].nil?      
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?      
      result['title'] = PrimitiveString.transform_json(json_hash['title'], json_hash['_title']) unless json_hash['title'].nil?      
      result['subtitle'] = PrimitiveString.transform_json(json_hash['subtitle'], json_hash['_subtitle']) unless json_hash['subtitle'].nil?      
      result['status'] = PublicationStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['experimental'] = PrimitiveBoolean.transform_json(json_hash['experimental'], json_hash['_experimental']) unless json_hash['experimental'].nil?      
      result['subjectCodeableConcept'] = CodeableConcept.transform_json(json_hash['subjectCodeableConcept']) unless json_hash['subjectCodeableConcept'].nil?      
      result['subjectReference'] = Reference.transform_json(json_hash['subjectReference']) unless json_hash['subjectReference'].nil?      
      result['date'] = PrimitiveDateTime.transform_json(json_hash['date'], json_hash['_date']) unless json_hash['date'].nil?      
      result['publisher'] = PrimitiveString.transform_json(json_hash['publisher'], json_hash['_publisher']) unless json_hash['publisher'].nil?      
      result['contact'] = json_hash['contact'].map { |var| ContactDetail.transform_json(var) } unless json_hash['contact'].nil?
      result['description'] = PrimitiveMarkdown.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
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
      result['kind'] = ActivityDefinitionKind.transform_json(json_hash['kind']) unless json_hash['kind'].nil?      
      result['profile'] = PrimitiveCanonical.transform_json(json_hash['profile'], json_hash['_profile']) unless json_hash['profile'].nil?      
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?      
      result['intent'] = RequestIntent.transform_json(json_hash['intent']) unless json_hash['intent'].nil?      
      result['priority'] = RequestPriority.transform_json(json_hash['priority']) unless json_hash['priority'].nil?      
      result['doNotPerform'] = PrimitiveBoolean.transform_json(json_hash['doNotPerform'], json_hash['_doNotPerform']) unless json_hash['doNotPerform'].nil?      
      result['timingTiming'] = Timing.transform_json(json_hash['timingTiming']) unless json_hash['timingTiming'].nil?      
      result['timingDateTime'] = PrimitiveDateTime.transform_json(json_hash['timingDateTime'], json_hash['_timingDateTime']) unless json_hash['timingDateTime'].nil?      
      result['timingAge'] = Age.transform_json(json_hash['timingAge']) unless json_hash['timingAge'].nil?      
      result['timingPeriod'] = Period.transform_json(json_hash['timingPeriod']) unless json_hash['timingPeriod'].nil?      
      result['timingRange'] = Range.transform_json(json_hash['timingRange']) unless json_hash['timingRange'].nil?      
      result['timingDuration'] = Duration.transform_json(json_hash['timingDuration']) unless json_hash['timingDuration'].nil?      
      result['location'] = Reference.transform_json(json_hash['location']) unless json_hash['location'].nil?      
      result['participant'] = json_hash['participant'].map { |var| ActivityDefinitionParticipant.transform_json(var) } unless json_hash['participant'].nil?
      result['productReference'] = Reference.transform_json(json_hash['productReference']) unless json_hash['productReference'].nil?      
      result['productCodeableConcept'] = CodeableConcept.transform_json(json_hash['productCodeableConcept']) unless json_hash['productCodeableConcept'].nil?      
      result['quantity'] = SimpleQuantity.transform_json(json_hash['quantity']) unless json_hash['quantity'].nil?      
      result['dosage'] = json_hash['dosage'].map { |var| Dosage.transform_json(var) } unless json_hash['dosage'].nil?
      result['bodySite'] = json_hash['bodySite'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['bodySite'].nil?
      result['specimenRequirement'] = json_hash['specimenRequirement'].map { |var| Reference.transform_json(var) } unless json_hash['specimenRequirement'].nil?
      result['observationRequirement'] = json_hash['observationRequirement'].map { |var| Reference.transform_json(var) } unless json_hash['observationRequirement'].nil?
      result['observationResultRequirement'] = json_hash['observationResultRequirement'].map { |var| Reference.transform_json(var) } unless json_hash['observationResultRequirement'].nil?
      result['transform'] = PrimitiveCanonical.transform_json(json_hash['transform'], json_hash['_transform']) unless json_hash['transform'].nil?      
      result['dynamicValue'] = json_hash['dynamicValue'].map { |var| ActivityDefinitionDynamicValue.transform_json(var) } unless json_hash['dynamicValue'].nil?

      result
    end
  end
end
