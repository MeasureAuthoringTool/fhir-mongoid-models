module FHIR
  # fhir/library.rb
  class Library < DomainResource
    include Mongoid::Document
    embeds_one :url, class_name: 'FHIR::PrimitiveUri'
    embeds_many :identifier, class_name: 'FHIR::Identifier'
    embeds_one :version, class_name: 'FHIR::PrimitiveString'
    embeds_one :name, class_name: 'FHIR::PrimitiveString'
    embeds_one :title, class_name: 'FHIR::PrimitiveString'
    embeds_one :subtitle, class_name: 'FHIR::PrimitiveString'
    embeds_one :status, class_name: 'FHIR::PublicationStatus'
    embeds_one :experimental, class_name: 'FHIR::PrimitiveBoolean'
    embeds_one :type, class_name: 'FHIR::CodeableConcept'
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
    embeds_many :parameter, class_name: 'FHIR::ParameterDefinition'
    embeds_many :dataRequirement, class_name: 'FHIR::DataRequirement'
    embeds_many :content, class_name: 'FHIR::Attachment'

    def create_data_elements(fhir_value_sets)
      dataRequirement.map do |dataReq|
        type = dataReq.type.value
        oid = dataReq.codeFilter.first&.valueSet&.value&.match(/([0-2])((\.0)|(\.[1-9][0-9]*))*$/).to_s
        fhir_value_set = fhir_value_sets.find{|fvs| fvs.fhirId == oid}
        title = fhir_value_set&.name&.value
        description = "#{type}: #{title}"

        CQM::DataElement.new(
          codeListId: oid,
          valueSetTitle: title,
          description: description,
          fhir_resource: "FHIR::#{type}".constantize.create
        )
      end
    end

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
      unless self.type.nil?
        result['type'] = self.type.as_json(*args)
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
      unless self.parameter.nil?  || !self.parameter.any?
        result['parameter'] = self.parameter.map{ |x| x.as_json(*args) }
      end
      unless self.dataRequirement.nil?  || !self.dataRequirement.any?
        result['dataRequirement'] = self.dataRequirement.map{ |x| x.as_json(*args) }
      end
      unless self.content.nil?  || !self.content.any?
        result['content'] = self.content.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end
      result
    end

    def self.transform_json(json_hash, target = Library.new)

      result = self.superclass.transform_json(json_hash, target)
      result['url'] = PrimitiveUri.transform_json(json_hash['url'], json_hash['_url']) unless json_hash['url'].nil?
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['version'] = PrimitiveString.transform_json(json_hash['version'], json_hash['_version']) unless json_hash['version'].nil?
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?
      result['title'] = PrimitiveString.transform_json(json_hash['title'], json_hash['_title']) unless json_hash['title'].nil?
      result['subtitle'] = PrimitiveString.transform_json(json_hash['subtitle'], json_hash['_subtitle']) unless json_hash['subtitle'].nil?
      result['status'] = PublicationStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['experimental'] = PrimitiveBoolean.transform_json(json_hash['experimental'], json_hash['_experimental']) unless json_hash['experimental'].nil?
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
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
      result['parameter'] = json_hash['parameter'].map { |var| ParameterDefinition.transform_json(var) } unless json_hash['parameter'].nil?
      result['dataRequirement'] = json_hash['dataRequirement'].map { |var| DataRequirement.transform_json(var) } unless json_hash['dataRequirement'].nil?
      result['content'] = json_hash['content'].map { |var| Attachment.transform_json(var) } unless json_hash['content'].nil?

      result
    end
  end
end
