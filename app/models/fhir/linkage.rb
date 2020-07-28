module FHIR
  # fhir/linkage.rb
  class Linkage < DomainResource
    include Mongoid::Document
    embeds_one :active, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :author, class_name: 'FHIR::Reference'    
    embeds_many :item, class_name: 'FHIR::LinkageItem'    

    def self.transform_json(json_hash, target = Linkage.new)
      result = self.superclass.transform_json(json_hash, target)
      result['active'] = PrimitiveBoolean.transform_json(json_hash['active'], json_hash['_active']) unless json_hash['active'].nil?
      result['author'] = Reference.transform_json(json_hash['author']) unless json_hash['author'].nil?
      result['item'] = json_hash['item'].map { |var| LinkageItem.transform_json(var) } unless json_hash['item'].nil?

      result
    end
  end
end
