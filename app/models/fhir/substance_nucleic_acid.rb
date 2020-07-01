module FHIR
  # fhir/substance_nucleic_acid.rb
  class SubstanceNucleicAcid < DomainResource
    include Mongoid::Document
    embeds_one :sequenceType, class_name: 'CodeableConcept'
    embeds_one :numberOfSubunits, class_name: 'PrimitiveInteger'
    embeds_one :areaOfHybridisation, class_name: 'PrimitiveString'
    embeds_one :oligoNucleotideType, class_name: 'CodeableConcept'
    embeds_many :subunit, class_name: 'SubstanceNucleicAcidSubunit'

    def self.transform_json(json_hash, target = SubstanceNucleicAcid.new)
      result = self.superclass.transform_json(json_hash, target)
      result['sequenceType'] = CodeableConcept.transform_json(json_hash['sequenceType']) unless json_hash['sequenceType'].nil?      
      result['numberOfSubunits'] = PrimitiveInteger.transform_json(json_hash['numberOfSubunits'], json_hash['_numberOfSubunits']) unless json_hash['numberOfSubunits'].nil?      
      result['areaOfHybridisation'] = PrimitiveString.transform_json(json_hash['areaOfHybridisation'], json_hash['_areaOfHybridisation']) unless json_hash['areaOfHybridisation'].nil?      
      result['oligoNucleotideType'] = CodeableConcept.transform_json(json_hash['oligoNucleotideType']) unless json_hash['oligoNucleotideType'].nil?      
      result['subunit'] = json_hash['subunit'].map { |var| SubstanceNucleicAcidSubunit.transform_json(var) } unless json_hash['subunit'].nil?

      result
    end
  end
end
