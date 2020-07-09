module FHIR
  # fhir/contact_point.rb
  class ContactPoint < Element
    include Mongoid::Document
    embeds_one :system, class_name: 'FHIR::ContactPointSystem'
    embeds_one :value, class_name: 'FHIR::PrimitiveString'
    embeds_one :use, class_name: 'FHIR::ContactPointUse'
    embeds_one :rank, class_name: 'FHIR::PrimitivePositiveInt'
    embeds_one :period, class_name: 'FHIR::Period'

    def self.transform_json(json_hash, target = ContactPoint.new)
      result = self.superclass.transform_json(json_hash, target)
      result['system'] = ContactPointSystem.transform_json(json_hash['system']) unless json_hash['system'].nil?      
      result['value'] = PrimitiveString.transform_json(json_hash['value'], json_hash['_value']) unless json_hash['value'].nil?      
      result['use'] = ContactPointUse.transform_json(json_hash['use']) unless json_hash['use'].nil?      
      result['rank'] = PrimitivePositiveInt.transform_json(json_hash['rank'], json_hash['_rank']) unless json_hash['rank'].nil?      
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?      

      result
    end
  end
end
