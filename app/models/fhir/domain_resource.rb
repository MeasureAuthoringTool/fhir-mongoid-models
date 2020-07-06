module FHIR
  # fhir/domain_resource.rb
  class DomainResource < Resource
    include Mongoid::Document
    embeds_one :text, class_name: 'Narrative'
    embeds_many :contained, class_name: 'Resource'
    embeds_many :extension, class_name: 'Extension'
    embeds_many :modifierExtension, class_name: 'Extension'

    def self.transform_json(json_hash, target = DomainResource.new)
      result = self.superclass.transform_json(json_hash, target)
      result['text'] = Narrative.transform_json(json_hash['text']) unless json_hash['text'].nil?      
      result['contained'] = json_hash['contained'].map { |var| Resource.transform_json(var) } unless json_hash['contained'].nil?
      result['extension'] = json_hash['extension'].map { |var| Extension.transform_json(var) } unless json_hash['extension'].nil?
      result['modifierExtension'] = json_hash['modifierExtension'].map { |var| Extension.transform_json(var) } unless json_hash['modifierExtension'].nil?

      result
    end
  end
end
