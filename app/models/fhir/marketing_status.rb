module FHIR
  # fhir/marketing_status.rb
  class MarketingStatus < BackboneElement
    include Mongoid::Document
    embeds_one :country, class_name: 'CodeableConcept'
    embeds_one :jurisdiction, class_name: 'CodeableConcept'
    embeds_one :status, class_name: 'CodeableConcept'
    embeds_one :dateRange, class_name: 'Period'
    embeds_one :restoreDate, class_name: 'PrimitiveDateTime'

    def self.transform_json(json_hash, target = MarketingStatus.new)
      result = self.superclass.transform_json(json_hash, target)
      result['country'] = CodeableConcept.transform_json(json_hash['country']) unless json_hash['country'].nil?      
      result['jurisdiction'] = CodeableConcept.transform_json(json_hash['jurisdiction']) unless json_hash['jurisdiction'].nil?      
      result['status'] = CodeableConcept.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['dateRange'] = Period.transform_json(json_hash['dateRange']) unless json_hash['dateRange'].nil?      
      result['restoreDate'] = PrimitiveDateTime.transform_json(json_hash['restoreDate'], json_hash['_restoreDate']) unless json_hash['restoreDate'].nil?      

      result
    end
  end
end
