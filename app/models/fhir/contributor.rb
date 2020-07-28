module FHIR
  # fhir/contributor.rb
  class Contributor < Element
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::ContributorType'    
    embeds_one :name, class_name: 'FHIR::PrimitiveString'    
    embeds_many :contact, class_name: 'FHIR::ContactDetail'    

    def self.transform_json(json_hash, target = Contributor.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = ContributorType.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?
      result['contact'] = json_hash['contact'].map { |var| ContactDetail.transform_json(var) } unless json_hash['contact'].nil?

      result
    end
  end
end
