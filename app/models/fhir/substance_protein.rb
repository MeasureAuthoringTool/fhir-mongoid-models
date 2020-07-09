module FHIR
  # fhir/substance_protein.rb
  class SubstanceProtein < DomainResource
    include Mongoid::Document
    embeds_one :sequenceType, class_name: 'FHIR::CodeableConcept'
    embeds_one :numberOfSubunits, class_name: 'FHIR::PrimitiveInteger'
    embeds_many :disulfideLinkage, class_name: 'FHIR::PrimitiveString'
    embeds_many :subunit, class_name: 'FHIR::SubstanceProteinSubunit'

    def self.transform_json(json_hash, target = SubstanceProtein.new)
      result = self.superclass.transform_json(json_hash, target)
      result['sequenceType'] = CodeableConcept.transform_json(json_hash['sequenceType']) unless json_hash['sequenceType'].nil?      
      result['numberOfSubunits'] = PrimitiveInteger.transform_json(json_hash['numberOfSubunits'], json_hash['_numberOfSubunits']) unless json_hash['numberOfSubunits'].nil?      
      result['disulfideLinkage'] = json_hash['disulfideLinkage'].each_with_index.map do |var, i|
        extension_hash = json_hash['_disulfideLinkage'] && json_hash['_disulfideLinkage'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['disulfideLinkage'].nil?
      result['subunit'] = json_hash['subunit'].map { |var| SubstanceProteinSubunit.transform_json(var) } unless json_hash['subunit'].nil?

      result
    end
  end
end
