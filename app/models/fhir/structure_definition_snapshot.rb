module FHIR
  # fhir/structure_definition_snapshot.rb
  class StructureDefinitionSnapshot < BackboneElement
    include Mongoid::Document
    embeds_many :element, class_name: 'FHIR::ElementDefinition'    

    def self.transform_json(json_hash, target = StructureDefinitionSnapshot.new)
      result = self.superclass.transform_json(json_hash, target)
      result['element'] = json_hash['element'].map { |var| ElementDefinition.transform_json(var) } unless json_hash['element'].nil?

      result
    end
  end
end
