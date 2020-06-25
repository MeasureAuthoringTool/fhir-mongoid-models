module FHIR
  # fhir/composition.rb
  class Composition < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'Composition'
    embeds_one :identifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'CompositionStatus'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_many :category, class_name: 'CodeableConcept'
    embeds_one :subject, class_name: 'Reference'
    embeds_one :encounter, class_name: 'Reference'
    embeds_one :date, class_name: 'PrimitiveDateTime'
    embeds_many :author, class_name: 'Reference'
    embeds_one :title, class_name: 'PrimitiveString'
    embeds_one :confidentiality, class_name: 'DocumentConfidentiality'
    embeds_many :attester, class_name: 'CompositionAttester'
    embeds_one :custodian, class_name: 'Reference'
    embeds_many :relatesTo, class_name: 'CompositionRelatesTo'
    embeds_many :event, class_name: 'CompositionEvent'
    embeds_many :section, class_name: 'CompositionSection'

    def self.transform_json(json_hash)
      result = Composition.new
      result['identifier'] = Identifier.transform_json(json_hash['identifier']) unless json_hash['identifier'].nil?      
      result['status'] = CompositionStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['category'] = json_hash['category'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['category'].nil?
      result['subject'] = Reference.transform_json(json_hash['subject']) unless json_hash['subject'].nil?      
      result['encounter'] = Reference.transform_json(json_hash['encounter']) unless json_hash['encounter'].nil?      
      result['date'] = PrimitiveDateTime.transform_json(json_hash['date'], json_hash['_date']) unless json_hash['date'].nil?      
      result['author'] = json_hash['author'].map { |var| Reference.transform_json(var) } unless json_hash['author'].nil?
      result['title'] = PrimitiveString.transform_json(json_hash['title'], json_hash['_title']) unless json_hash['title'].nil?      
      result['confidentiality'] = DocumentConfidentiality.transform_json(json_hash['confidentiality']) unless json_hash['confidentiality'].nil?      
      result['attester'] = json_hash['attester'].map { |var| CompositionAttester.transform_json(var) } unless json_hash['attester'].nil?
      result['custodian'] = Reference.transform_json(json_hash['custodian']) unless json_hash['custodian'].nil?      
      result['relatesTo'] = json_hash['relatesTo'].map { |var| CompositionRelatesTo.transform_json(var) } unless json_hash['relatesTo'].nil?
      result['event'] = json_hash['event'].map { |var| CompositionEvent.transform_json(var) } unless json_hash['event'].nil?
      result['section'] = json_hash['section'].map { |var| CompositionSection.transform_json(var) } unless json_hash['section'].nil?

      result
    end
  end
end
