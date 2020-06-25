module FHIR
  # fhir/account_guarantor.rb
  class AccountGuarantor < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'AccountGuarantor'
    embeds_one :party, class_name: 'Reference'
    embeds_one :onHold, class_name: 'PrimitiveBoolean'
    embeds_one :period, class_name: 'Period'

    def self.transform_json(json_hash)
      result = AccountGuarantor.new
      result['party'] = Reference.transform_json(json_hash['party']) unless json_hash['party'].nil?      
      result['onHold'] = PrimitiveBoolean.transform_json(json_hash['onHold'], json_hash['_onHold']) unless json_hash['onHold'].nil?      
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?      

      result
    end
  end
end
