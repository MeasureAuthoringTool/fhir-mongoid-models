module FHIR
  # fhir/substance_reference_information_classification.rb
  class SubstanceReferenceInformationClassification < BackboneElement
    include Mongoid::Document
    embeds_one :domain, class_name: 'CodeableConcept'
    embeds_one :classification, class_name: 'CodeableConcept'
    embeds_many :subtype, class_name: 'CodeableConcept'
    embeds_many :source, class_name: 'Reference'

    def self.transform_json(json_hash, target = SubstanceReferenceInformationClassification.new)
      result = self.superclass.transform_json(json_hash, target)
      result['domain'] = CodeableConcept.transform_json(json_hash['domain']) unless json_hash['domain'].nil?      
      result['classification'] = CodeableConcept.transform_json(json_hash['classification']) unless json_hash['classification'].nil?      
      result['subtype'] = json_hash['subtype'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['subtype'].nil?
      result['source'] = json_hash['source'].map { |var| Reference.transform_json(var) } unless json_hash['source'].nil?

      result
    end
  end
end
