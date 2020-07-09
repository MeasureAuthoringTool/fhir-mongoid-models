module FHIR
  # fhir/research_study_objective.rb
  class ResearchStudyObjective < BackboneElement
    include Mongoid::Document
    embeds_one :name, class_name: 'FHIR::PrimitiveString'
    embeds_one :type, class_name: 'FHIR::CodeableConcept'

    def self.transform_json(json_hash, target = ResearchStudyObjective.new)
      result = self.superclass.transform_json(json_hash, target)
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?      
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      

      result
    end
  end
end
