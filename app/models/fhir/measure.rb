module FHIR
  # fhir/measure.rb
  class Measure < DomainResource
    include Mongoid::Document
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
    embeds_one :disclaimer, class_name: 'PrimitiveMarkdown'
    embeds_one :scoring, class_name: 'CodeableConcept'
    embeds_one :compositeScoring, class_name: 'CodeableConcept'
    embeds_many :type, class_name: 'CodeableConcept'
    embeds_one :riskAdjustment, class_name: 'PrimitiveString'
    embeds_one :rateAggregation, class_name: 'PrimitiveString'
    embeds_one :rationale, class_name: 'PrimitiveMarkdown'
    embeds_one :clinicalRecommendationStatement, class_name: 'PrimitiveMarkdown'
    embeds_one :improvementNotation, class_name: 'CodeableConcept'
    embeds_many :definition, class_name: 'PrimitiveMarkdown'
    embeds_one :guidance, class_name: 'PrimitiveMarkdown'
    embeds_many :group, class_name: 'MeasureGroup'
    embeds_many :supplementalData, class_name: 'MeasureSupplementalData'
    has_and_belongs_to_many :valueSets, class_name: 'ValueSet', inverse_of: nil
    has_and_belongs_to_many :patients, class_name: 'Patient', inverse_of: nil

    def self.transform_json(json_hash, target = Measure.new)
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
      result['disclaimer'] = PrimitiveMarkdown.transform_json(json_hash['disclaimer'], json_hash['_disclaimer']) unless json_hash['disclaimer'].nil?      
      result['scoring'] = CodeableConcept.transform_json(json_hash['scoring']) unless json_hash['scoring'].nil?      
      result['compositeScoring'] = CodeableConcept.transform_json(json_hash['compositeScoring']) unless json_hash['compositeScoring'].nil?      
      result['type'] = json_hash['type'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['type'].nil?
      result['riskAdjustment'] = PrimitiveString.transform_json(json_hash['riskAdjustment'], json_hash['_riskAdjustment']) unless json_hash['riskAdjustment'].nil?      
      result['rateAggregation'] = PrimitiveString.transform_json(json_hash['rateAggregation'], json_hash['_rateAggregation']) unless json_hash['rateAggregation'].nil?      
      result['rationale'] = PrimitiveMarkdown.transform_json(json_hash['rationale'], json_hash['_rationale']) unless json_hash['rationale'].nil?      
      result['clinicalRecommendationStatement'] = PrimitiveMarkdown.transform_json(json_hash['clinicalRecommendationStatement'], json_hash['_clinicalRecommendationStatement']) unless json_hash['clinicalRecommendationStatement'].nil?      
      result['improvementNotation'] = CodeableConcept.transform_json(json_hash['improvementNotation']) unless json_hash['improvementNotation'].nil?      
      result['definition'] = json_hash['definition'].each_with_index.map do |var, i|
        extension_hash = json_hash['_definition'] && json_hash['_definition'][i]
        PrimitiveMarkdown.transform_json(var, extension_hash)
      end unless json_hash['definition'].nil?
      result['guidance'] = PrimitiveMarkdown.transform_json(json_hash['guidance'], json_hash['_guidance']) unless json_hash['guidance'].nil?      
      result['group'] = json_hash['group'].map { |var| MeasureGroup.transform_json(var) } unless json_hash['group'].nil?
      result['supplementalData'] = json_hash['supplementalData'].map { |var| MeasureSupplementalData.transform_json(var) } unless json_hash['supplementalData'].nil?
      result['valueSets'] = json_hash['valueSets'].map { |var| ValueSet.transform_json(var) } unless json_hash['valueSets'].nil?
      result['patients'] = json_hash['patients'].map { |var| Patient.transform_json(var) } unless json_hash['patients'].nil?

      result
    end
  end
end
