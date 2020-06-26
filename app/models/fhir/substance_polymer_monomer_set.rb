module FHIR
  # fhir/substance_polymer_monomer_set.rb
  class SubstancePolymerMonomerSet < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SubstancePolymerMonomerSet'
    embeds_one :ratioType, class_name: 'CodeableConcept'
    embeds_many :startingMaterial, class_name: 'SubstancePolymerMonomerSetStartingMaterial'

    def self.transform_json(json_hash)
      result = SubstancePolymerMonomerSet.new
      result['ratioType'] = CodeableConcept.transform_json(json_hash['ratioType']) unless json_hash['ratioType'].nil?      
      result['startingMaterial'] = json_hash['startingMaterial'].map { |var| SubstancePolymerMonomerSetStartingMaterial.transform_json(var) } unless json_hash['startingMaterial'].nil?

      result
    end
  end
end
