module FHIR
  # fhir/medication_knowledge_medicine_classification.rb
  class MedicationKnowledgeMedicineClassification < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationKnowledgeMedicineClassification'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_many :classification, class_name: 'CodeableConcept'

    def self.transform_json(json_hash, target=MedicationKnowledgeMedicineClassification.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['classification'] = json_hash['classification'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['classification'].nil?

      result
    end
  end
end
