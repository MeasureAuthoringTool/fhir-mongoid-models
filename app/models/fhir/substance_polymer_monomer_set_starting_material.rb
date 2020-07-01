module FHIR
  # fhir/substance_polymer_monomer_set_starting_material.rb
  class SubstancePolymerMonomerSetStartingMaterial < BackboneElement
    include Mongoid::Document
    embeds_one :material, class_name: 'CodeableConcept'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :isDefining, class_name: 'PrimitiveBoolean'
    embeds_one :amount, class_name: 'SubstanceAmount'

    def self.transform_json(json_hash, target = SubstancePolymerMonomerSetStartingMaterial.new)
      result = self.superclass.transform_json(json_hash, target)
      result['material'] = CodeableConcept.transform_json(json_hash['material']) unless json_hash['material'].nil?      
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['isDefining'] = PrimitiveBoolean.transform_json(json_hash['isDefining'], json_hash['_isDefining']) unless json_hash['isDefining'].nil?      
      result['amount'] = SubstanceAmount.transform_json(json_hash['amount']) unless json_hash['amount'].nil?      

      result
    end
  end
end
