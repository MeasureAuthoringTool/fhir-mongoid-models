module FHIR
  # fhir/substance.rb
  class Substance < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'Substance'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'FHIRSubstanceStatus'
    embeds_many :category, class_name: 'CodeableConcept'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_one :description, class_name: 'PrimitiveString'
    embeds_many :instance, class_name: 'SubstanceInstance'
    embeds_many :ingredient, class_name: 'SubstanceIngredient'

    def self.transform_json(json_hash, target=Substance.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['status'] = FHIRSubstanceStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['category'] = json_hash['category'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['category'].nil?
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?      
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['instance'] = json_hash['instance'].map { |var| SubstanceInstance.transform_json(var) } unless json_hash['instance'].nil?
      result['ingredient'] = json_hash['ingredient'].map { |var| SubstanceIngredient.transform_json(var) } unless json_hash['ingredient'].nil?

      result
    end
  end
end
