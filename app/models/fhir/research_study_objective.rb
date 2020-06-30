module FHIR
  # fhir/research_study_objective.rb
  class ResearchStudyObjective < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ResearchStudyObjective'
    embeds_one :name, class_name: 'PrimitiveString'
    embeds_one :type, class_name: 'CodeableConcept'

    def self.transform_json(json_hash, target=ResearchStudyObjective.new)
      result = self.superclass.transform_json(json_hash, target)
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?      
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      

      result
    end
  end
end
