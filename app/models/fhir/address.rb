module FHIR
  # fhir/address.rb
  class Address < Element
    include Mongoid::Document
    embeds_one :use, class_name: 'AddressUse'
    embeds_one :type, class_name: 'AddressType'
    embeds_one :text, class_name: 'PrimitiveString'
    embeds_many :line, class_name: 'PrimitiveString'
    embeds_one :city, class_name: 'PrimitiveString'
    embeds_one :district, class_name: 'PrimitiveString'
    embeds_one :state, class_name: 'PrimitiveString'
    embeds_one :postalCode, class_name: 'PrimitiveString'
    embeds_one :country, class_name: 'PrimitiveString'
    embeds_one :period, class_name: 'Period'

    def self.transform_json(json_hash, target = Address.new)
      result = self.superclass.transform_json(json_hash, target)
      result['use'] = AddressUse.transform_json(json_hash['use']) unless json_hash['use'].nil?      
      result['type'] = AddressType.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['text'] = PrimitiveString.transform_json(json_hash['text'], json_hash['_text']) unless json_hash['text'].nil?      
      result['line'] = json_hash['line'].each_with_index.map do |var, i|
        extension_hash = json_hash['_line'] && json_hash['_line'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['line'].nil?
      result['city'] = PrimitiveString.transform_json(json_hash['city'], json_hash['_city']) unless json_hash['city'].nil?      
      result['district'] = PrimitiveString.transform_json(json_hash['district'], json_hash['_district']) unless json_hash['district'].nil?      
      result['state'] = PrimitiveString.transform_json(json_hash['state'], json_hash['_state']) unless json_hash['state'].nil?      
      result['postalCode'] = PrimitiveString.transform_json(json_hash['postalCode'], json_hash['_postalCode']) unless json_hash['postalCode'].nil?      
      result['country'] = PrimitiveString.transform_json(json_hash['country'], json_hash['_country']) unless json_hash['country'].nil?      
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?      

      result
    end
  end
end
