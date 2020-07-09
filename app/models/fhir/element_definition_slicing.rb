module FHIR
  # fhir/element_definition_slicing.rb
  class ElementDefinitionSlicing < Element
    include Mongoid::Document
    embeds_many :discriminator, class_name: 'FHIR::ElementDefinitionSlicingDiscriminator'
    embeds_one :description, class_name: 'FHIR::PrimitiveString'
    embeds_one :ordered, class_name: 'FHIR::PrimitiveBoolean'
    embeds_one :rules, class_name: 'FHIR::SlicingRules'

    def self.transform_json(json_hash, target = ElementDefinitionSlicing.new)
      result = self.superclass.transform_json(json_hash, target)
      result['discriminator'] = json_hash['discriminator'].map { |var| ElementDefinitionSlicingDiscriminator.transform_json(var) } unless json_hash['discriminator'].nil?
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['ordered'] = PrimitiveBoolean.transform_json(json_hash['ordered'], json_hash['_ordered']) unless json_hash['ordered'].nil?      
      result['rules'] = SlicingRules.transform_json(json_hash['rules']) unless json_hash['rules'].nil?      

      result
    end
  end
end
