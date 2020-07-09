module FHIR
  # fhir/medication_knowledge_regulatory.rb
  class MedicationKnowledgeRegulatory < BackboneElement
    include Mongoid::Document
    embeds_one :regulatoryAuthority, class_name: 'FHIR::Reference'
    embeds_many :substitution, class_name: 'FHIR::MedicationKnowledgeRegulatorySubstitution'
    embeds_many :schedule, class_name: 'FHIR::MedicationKnowledgeRegulatorySchedule'
    embeds_one :maxDispense, class_name: 'FHIR::MedicationKnowledgeRegulatoryMaxDispense'

    def self.transform_json(json_hash, target = MedicationKnowledgeRegulatory.new)
      result = self.superclass.transform_json(json_hash, target)
      result['regulatoryAuthority'] = Reference.transform_json(json_hash['regulatoryAuthority']) unless json_hash['regulatoryAuthority'].nil?      
      result['substitution'] = json_hash['substitution'].map { |var| MedicationKnowledgeRegulatorySubstitution.transform_json(var) } unless json_hash['substitution'].nil?
      result['schedule'] = json_hash['schedule'].map { |var| MedicationKnowledgeRegulatorySchedule.transform_json(var) } unless json_hash['schedule'].nil?
      result['maxDispense'] = MedicationKnowledgeRegulatoryMaxDispense.transform_json(json_hash['maxDispense']) unless json_hash['maxDispense'].nil?      

      result
    end
  end
end
