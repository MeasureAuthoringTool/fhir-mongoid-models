module FHIR
  # fhir/backbone_element.rb
  class BackboneElement < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'BackboneElement'
    embeds_many :modifierExtension, class_name: 'Extension'

    def self.transform_json(json_hash)
      result = BackboneElement.new
      result['modifierExtension'] = json_hash['modifierExtension'].map { |var| Extension.transform_json(var) } unless json_hash['modifierExtension'].nil?

      result
    end
  end
end
