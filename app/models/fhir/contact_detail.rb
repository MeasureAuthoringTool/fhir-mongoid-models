module FHIR
  # fhir/contact_detail.rb
  class ContactDetail < Element
    include Mongoid::Document
    embeds_one :name, class_name: 'FHIR::PrimitiveString'    
    embeds_many :telecom, class_name: 'FHIR::ContactPoint'    

    def self.transform_json(json_hash, target = ContactDetail.new)
      result = self.superclass.transform_json(json_hash, target)
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?
      result['telecom'] = json_hash['telecom'].map { |var| ContactPoint.transform_json(var) } unless json_hash['telecom'].nil?

      result
    end
  end
end
