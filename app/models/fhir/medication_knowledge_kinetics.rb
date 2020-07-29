module FHIR
  # fhir/medication_knowledge_kinetics.rb
  class MedicationKnowledgeKinetics < BackboneElement
    include Mongoid::Document
    embeds_many :areaUnderCurve, class_name: 'FHIR::SimpleQuantity'    
    embeds_many :lethalDose50, class_name: 'FHIR::SimpleQuantity'    
    embeds_one :halfLifePeriod, class_name: 'FHIR::Duration'    

    def self.transform_json(json_hash, target = MedicationKnowledgeKinetics.new)
      result = self.superclass.transform_json(json_hash, target)
      result['areaUnderCurve'] = json_hash['areaUnderCurve'].map { |var| SimpleQuantity.transform_json(var) } unless json_hash['areaUnderCurve'].nil?
      result['lethalDose50'] = json_hash['lethalDose50'].map { |var| SimpleQuantity.transform_json(var) } unless json_hash['lethalDose50'].nil?
      result['halfLifePeriod'] = Duration.transform_json(json_hash['halfLifePeriod']) unless json_hash['halfLifePeriod'].nil?

      result
    end
  end
end
