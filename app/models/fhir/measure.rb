module FHIR
  # fhir/measure.rb
  class Measure < DomainResource
    include Mongoid::Document
    embeds_one :url, class_name: 'FHIR::PrimitiveUri'    
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :version, class_name: 'FHIR::PrimitiveString'    
    embeds_one :name, class_name: 'FHIR::PrimitiveString'    
    embeds_one :title, class_name: 'FHIR::PrimitiveString'    
    embeds_one :subtitle, class_name: 'FHIR::PrimitiveString'    
    embeds_one :status, class_name: 'FHIR::PublicationStatus'    
    embeds_one :experimental, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :subjectCodeableConcept, class_name: 'FHIR::CodeableConcept'    
    embeds_one :subjectReference, class_name: 'FHIR::Reference'    
    embeds_one :date, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :publisher, class_name: 'FHIR::PrimitiveString'    
    embeds_many :contact, class_name: 'FHIR::ContactDetail'    
    embeds_one :description, class_name: 'FHIR::PrimitiveMarkdown'    
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
    embeds_one :disclaimer, class_name: 'FHIR::PrimitiveMarkdown'    
    embeds_one :scoring, class_name: 'FHIR::CodeableConcept'    
    embeds_one :compositeScoring, class_name: 'FHIR::CodeableConcept'    
    embeds_many :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :riskAdjustment, class_name: 'FHIR::PrimitiveString'    
    embeds_one :rateAggregation, class_name: 'FHIR::PrimitiveString'    
    embeds_one :rationale, class_name: 'FHIR::PrimitiveMarkdown'    
    embeds_one :clinicalRecommendationStatement, class_name: 'FHIR::PrimitiveMarkdown'    
    embeds_one :improvementNotation, class_name: 'FHIR::CodeableConcept'    
    embeds_many :definition, class_name: 'FHIR::PrimitiveMarkdown'    
    embeds_one :guidance, class_name: 'FHIR::PrimitiveMarkdown'    
    embeds_many :group, class_name: 'FHIR::MeasureGroup'    
    embeds_many :supplementalData, class_name: 'FHIR::MeasureSupplementalData'    
    has_and_belongs_to_many :valueSets, class_name: 'FHIR::ValueSet', inverse_of: nil    
    has_and_belongs_to_many :patients, class_name: 'FHIR::Patient', inverse_of: nil    
    
    def as_json(*args)
      result = super      
      unless self.url.nil? 
        result['url'] = self.url.value
        serialized = Extension.serializePrimitiveExtension(self.url)            
        result['_url'] = serialized unless serialized.nil?
      end
      unless self.identifier.nil?  || !self.identifier.any? 
        result['identifier'] = self.identifier.map{ |x| x.as_json(*args) }
      end
      unless self.version.nil? 
        result['version'] = self.version.value
        serialized = Extension.serializePrimitiveExtension(self.version)            
        result['_version'] = serialized unless serialized.nil?
      end
      unless self.name.nil? 
        result['name'] = self.name.value
        serialized = Extension.serializePrimitiveExtension(self.name)            
        result['_name'] = serialized unless serialized.nil?
      end
      unless self.title.nil? 
        result['title'] = self.title.value
        serialized = Extension.serializePrimitiveExtension(self.title)            
        result['_title'] = serialized unless serialized.nil?
      end
      unless self.subtitle.nil? 
        result['subtitle'] = self.subtitle.value
        serialized = Extension.serializePrimitiveExtension(self.subtitle)            
        result['_subtitle'] = serialized unless serialized.nil?
      end
      unless self.status.nil? 
        result['status'] = self.status.value
        serialized = Extension.serializePrimitiveExtension(self.status)            
        result['_status'] = serialized unless serialized.nil?
      end
      unless self.experimental.nil? 
        result['experimental'] = self.experimental.value
        serialized = Extension.serializePrimitiveExtension(self.experimental)            
        result['_experimental'] = serialized unless serialized.nil?
      end
      unless self.subjectCodeableConcept.nil?
        result['subjectCodeableConcept'] = self.subjectCodeableConcept.as_json(*args)                        
      end          
      unless self.subjectReference.nil?
        result['subjectReference'] = self.subjectReference.as_json(*args)                        
      end          
      unless self.date.nil? 
        result['date'] = self.date.value
        serialized = Extension.serializePrimitiveExtension(self.date)            
        result['_date'] = serialized unless serialized.nil?
      end
      unless self.publisher.nil? 
        result['publisher'] = self.publisher.value
        serialized = Extension.serializePrimitiveExtension(self.publisher)            
        result['_publisher'] = serialized unless serialized.nil?
      end
      unless self.contact.nil?  || !self.contact.any? 
        result['contact'] = self.contact.map{ |x| x.as_json(*args) }
      end
      unless self.description.nil? 
        result['description'] = self.description.value
        serialized = Extension.serializePrimitiveExtension(self.description)            
        result['_description'] = serialized unless serialized.nil?
      end
      unless self.useContext.nil?  || !self.useContext.any? 
        result['useContext'] = self.useContext.map{ |x| x.as_json(*args) }
      end
      unless self.jurisdiction.nil?  || !self.jurisdiction.any? 
        result['jurisdiction'] = self.jurisdiction.map{ |x| x.as_json(*args) }
      end
      unless self.purpose.nil? 
        result['purpose'] = self.purpose.value
        serialized = Extension.serializePrimitiveExtension(self.purpose)            
        result['_purpose'] = serialized unless serialized.nil?
      end
      unless self.usage.nil? 
        result['usage'] = self.usage.value
        serialized = Extension.serializePrimitiveExtension(self.usage)            
        result['_usage'] = serialized unless serialized.nil?
      end
      unless self.copyright.nil? 
        result['copyright'] = self.copyright.value
        serialized = Extension.serializePrimitiveExtension(self.copyright)            
        result['_copyright'] = serialized unless serialized.nil?
      end
      unless self.approvalDate.nil? 
        result['approvalDate'] = self.approvalDate.value
        serialized = Extension.serializePrimitiveExtension(self.approvalDate)            
        result['_approvalDate'] = serialized unless serialized.nil?
      end
      unless self.lastReviewDate.nil? 
        result['lastReviewDate'] = self.lastReviewDate.value
        serialized = Extension.serializePrimitiveExtension(self.lastReviewDate)            
        result['_lastReviewDate'] = serialized unless serialized.nil?
      end
      unless self.effectivePeriod.nil? 
        result['effectivePeriod'] = self.effectivePeriod.as_json(*args)
      end
      unless self.topic.nil?  || !self.topic.any? 
        result['topic'] = self.topic.map{ |x| x.as_json(*args) }
      end
      unless self.author.nil?  || !self.author.any? 
        result['author'] = self.author.map{ |x| x.as_json(*args) }
      end
      unless self.editor.nil?  || !self.editor.any? 
        result['editor'] = self.editor.map{ |x| x.as_json(*args) }
      end
      unless self.reviewer.nil?  || !self.reviewer.any? 
        result['reviewer'] = self.reviewer.map{ |x| x.as_json(*args) }
      end
      unless self.endorser.nil?  || !self.endorser.any? 
        result['endorser'] = self.endorser.map{ |x| x.as_json(*args) }
      end
      unless self.relatedArtifact.nil?  || !self.relatedArtifact.any? 
        result['relatedArtifact'] = self.relatedArtifact.map{ |x| x.as_json(*args) }
      end
      unless self.library.nil?  || !self.library.any? 
        result['library'] = self.library.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.library)                              
        result['_library'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.disclaimer.nil? 
        result['disclaimer'] = self.disclaimer.value
        serialized = Extension.serializePrimitiveExtension(self.disclaimer)            
        result['_disclaimer'] = serialized unless serialized.nil?
      end
      unless self.scoring.nil? 
        result['scoring'] = self.scoring.as_json(*args)
      end
      unless self.compositeScoring.nil? 
        result['compositeScoring'] = self.compositeScoring.as_json(*args)
      end
      unless self.type.nil?  || !self.type.any? 
        result['type'] = self.type.map{ |x| x.as_json(*args) }
      end
      unless self.riskAdjustment.nil? 
        result['riskAdjustment'] = self.riskAdjustment.value
        serialized = Extension.serializePrimitiveExtension(self.riskAdjustment)            
        result['_riskAdjustment'] = serialized unless serialized.nil?
      end
      unless self.rateAggregation.nil? 
        result['rateAggregation'] = self.rateAggregation.value
        serialized = Extension.serializePrimitiveExtension(self.rateAggregation)            
        result['_rateAggregation'] = serialized unless serialized.nil?
      end
      unless self.rationale.nil? 
        result['rationale'] = self.rationale.value
        serialized = Extension.serializePrimitiveExtension(self.rationale)            
        result['_rationale'] = serialized unless serialized.nil?
      end
      unless self.clinicalRecommendationStatement.nil? 
        result['clinicalRecommendationStatement'] = self.clinicalRecommendationStatement.value
        serialized = Extension.serializePrimitiveExtension(self.clinicalRecommendationStatement)            
        result['_clinicalRecommendationStatement'] = serialized unless serialized.nil?
      end
      unless self.improvementNotation.nil? 
        result['improvementNotation'] = self.improvementNotation.as_json(*args)
      end
      unless self.definition.nil?  || !self.definition.any? 
        result['definition'] = self.definition.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.definition)                              
        result['_definition'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.guidance.nil? 
        result['guidance'] = self.guidance.value
        serialized = Extension.serializePrimitiveExtension(self.guidance)            
        result['_guidance'] = serialized unless serialized.nil?
      end
      unless self.group.nil?  || !self.group.any? 
        result['group'] = self.group.map{ |x| x.as_json(*args) }
      end
      unless self.supplementalData.nil?  || !self.supplementalData.any? 
        result['supplementalData'] = self.supplementalData.map{ |x| x.as_json(*args) }
      end
      unless self.valueSets.nil?  || !self.valueSets.any? 
        result['valueSets'] = self.valueSets.map{ |x| x.as_json(*args) }
      end
      unless self.patients.nil?  || !self.patients.any? 
        result['patients'] = self.patients.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = Measure.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['url'] = PrimitiveUri.transform_json(json_hash['url'], json_hash['_url']) unless json_hash['url'].nil?
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['version'] = PrimitiveString.transform_json(json_hash['version'], json_hash['_version']) unless json_hash['version'].nil?
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?
      result['title'] = PrimitiveString.transform_json(json_hash['title'], json_hash['_title']) unless json_hash['title'].nil?
      result['subtitle'] = PrimitiveString.transform_json(json_hash['subtitle'], json_hash['_subtitle']) unless json_hash['subtitle'].nil?
      result['status'] = PublicationStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
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
