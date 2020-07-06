module FHIR
  # fhir/medicinal_product_undesirable_effect.rb
  class MedicinalProductUndesirableEffect < DomainResource
    include Mongoid::Document
    embeds_many :subject, class_name: 'Reference'
    embeds_one :symptomConditionEffect, class_name: 'CodeableConcept'
    embeds_one :classification, class_name: 'CodeableConcept'
    embeds_one :frequencyOfOccurrence, class_name: 'CodeableConcept'
    embeds_many :population, class_name: 'Population'

    def self.transform_json(json_hash, target = MedicinalProductUndesirableEffect.new)
      result = self.superclass.transform_json(json_hash, target)
      result['subject'] = json_hash['subject'].map { |var| Reference.transform_json(var) } unless json_hash['subject'].nil?
      result['symptomConditionEffect'] = CodeableConcept.transform_json(json_hash['symptomConditionEffect']) unless json_hash['symptomConditionEffect'].nil?      
      result['classification'] = CodeableConcept.transform_json(json_hash['classification']) unless json_hash['classification'].nil?      
      result['frequencyOfOccurrence'] = CodeableConcept.transform_json(json_hash['frequencyOfOccurrence']) unless json_hash['frequencyOfOccurrence'].nil?      
      result['population'] = json_hash['population'].map { |var| Population.transform_json(var) } unless json_hash['population'].nil?

      result
    end
  end
end
