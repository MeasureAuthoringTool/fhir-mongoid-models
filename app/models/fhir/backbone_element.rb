module FHIR
  # fhir/backbone_element.rb
  class BackboneElement < Element
    include Mongoid::Document
    embeds_many :modifierExtension, class_name: 'FHIR::Extension'    

    def self.transform_json(json_hash, target = BackboneElement.new)
      result = self.superclass.transform_json(json_hash, target)
      result['modifierExtension'] = json_hash['modifierExtension'].map { |var| Extension.transform_json(var) } unless json_hash['modifierExtension'].nil?

      result
    end
  end
end
