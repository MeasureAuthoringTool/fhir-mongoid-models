module FHIR
  # fhir/research_study_arm.rb
  class ResearchStudyArm < BackboneElement
    include Mongoid::Document
    embeds_one :name, class_name: 'PrimitiveString'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :description, class_name: 'PrimitiveString'

    def self.transform_json(json_hash, target = ResearchStudyArm.new)
      result = self.superclass.transform_json(json_hash, target)
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?      
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      

      result
    end
  end
end
