module FHIR
  # fhir/specimen_definition.rb
  class SpecimenDefinition < DomainResource
    include Mongoid::Document
    embeds_one :identifier, class_name: 'Identifier'
    embeds_one :typeCollected, class_name: 'CodeableConcept'
    embeds_many :patientPreparation, class_name: 'CodeableConcept'
    embeds_one :timeAspect, class_name: 'PrimitiveString'
    embeds_many :_collection, class_name: 'CodeableConcept'
    embeds_many :typeTested, class_name: 'SpecimenDefinitionTypeTested'
    
    def as_json(*args)
      res = super
      res['collection'] = res.delete('_collection')
      res
    end

    def self.transform_json(json_hash, target = SpecimenDefinition.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = Identifier.transform_json(json_hash['identifier']) unless json_hash['identifier'].nil?      
      result['typeCollected'] = CodeableConcept.transform_json(json_hash['typeCollected']) unless json_hash['typeCollected'].nil?      
      result['patientPreparation'] = json_hash['patientPreparation'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['patientPreparation'].nil?
      result['timeAspect'] = PrimitiveString.transform_json(json_hash['timeAspect'], json_hash['_timeAspect']) unless json_hash['timeAspect'].nil?      
      result['_collection'] = json_hash['collection'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['collection'].nil?
      result['typeTested'] = json_hash['typeTested'].map { |var| SpecimenDefinitionTypeTested.transform_json(var) } unless json_hash['typeTested'].nil?

      result
    end
  end
end
