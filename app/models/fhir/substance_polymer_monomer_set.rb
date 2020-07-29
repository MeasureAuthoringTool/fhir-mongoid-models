module FHIR
  # fhir/substance_polymer_monomer_set.rb
  class SubstancePolymerMonomerSet < BackboneElement
    include Mongoid::Document
    embeds_one :ratioType, class_name: 'FHIR::CodeableConcept'    
    embeds_many :startingMaterial, class_name: 'FHIR::SubstancePolymerMonomerSetStartingMaterial'    

    def self.transform_json(json_hash, target = SubstancePolymerMonomerSet.new)
      result = self.superclass.transform_json(json_hash, target)
      result['ratioType'] = CodeableConcept.transform_json(json_hash['ratioType']) unless json_hash['ratioType'].nil?
      result['startingMaterial'] = json_hash['startingMaterial'].map { |var| SubstancePolymerMonomerSetStartingMaterial.transform_json(var) } unless json_hash['startingMaterial'].nil?

      result
    end
  end
end
