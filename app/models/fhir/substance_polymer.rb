module FHIR
  # fhir/substance_polymer.rb
  class SubstancePolymer < DomainResource
    include Mongoid::Document
    embeds_one :class, class_name: 'FHIR::CodeableConcept'    
    embeds_one :geometry, class_name: 'FHIR::CodeableConcept'    
    embeds_many :copolymerConnectivity, class_name: 'FHIR::CodeableConcept'    
    embeds_many :modification, class_name: 'FHIR::PrimitiveString'    
    embeds_many :monomerSet, class_name: 'FHIR::SubstancePolymerMonomerSet'    
    embeds_many :repeat, class_name: 'FHIR::SubstancePolymerRepeat'    

    def self.transform_json(json_hash, target = SubstancePolymer.new)
      result = self.superclass.transform_json(json_hash, target)
      result['class'] = CodeableConcept.transform_json(json_hash['class']) unless json_hash['class'].nil?
      result['geometry'] = CodeableConcept.transform_json(json_hash['geometry']) unless json_hash['geometry'].nil?
      result['copolymerConnectivity'] = json_hash['copolymerConnectivity'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['copolymerConnectivity'].nil?
      result['modification'] = json_hash['modification'].each_with_index.map do |var, i|
        extension_hash = json_hash['_modification'] && json_hash['_modification'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['modification'].nil?
      result['monomerSet'] = json_hash['monomerSet'].map { |var| SubstancePolymerMonomerSet.transform_json(var) } unless json_hash['monomerSet'].nil?
      result['repeat'] = json_hash['repeat'].map { |var| SubstancePolymerRepeat.transform_json(var) } unless json_hash['repeat'].nil?

      result
    end
  end
end
