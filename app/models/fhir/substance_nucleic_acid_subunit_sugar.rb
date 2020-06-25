module FHIR
  # fhir/substance_nucleic_acid_subunit_sugar.rb
  class SubstanceNucleicAcidSubunitSugar < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SubstanceNucleicAcidSubunitSugar'
    embeds_one :identifier, class_name: 'Identifier'
    embeds_one :name, class_name: 'PrimitiveString'
    embeds_one :residueSite, class_name: 'PrimitiveString'

    def self.transform_json(json_hash)
      result = SubstanceNucleicAcidSubunitSugar.new
      result['identifier'] = Identifier.transform_json(json_hash['identifier']) unless json_hash['identifier'].nil?      
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?      
      result['residueSite'] = PrimitiveString.transform_json(json_hash['residueSite'], json_hash['_residueSite']) unless json_hash['residueSite'].nil?      

      result
    end
  end
end
