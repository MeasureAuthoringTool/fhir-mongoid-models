module FHIR
  # fhir/human_name.rb
  class HumanName < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'HumanName'
    embeds_one :use, class_name: 'NameUse'
    embeds_one :text, class_name: 'PrimitiveString'
    embeds_one :family, class_name: 'PrimitiveString'
    embeds_many :given, class_name: 'PrimitiveString'
    embeds_many :prefix, class_name: 'PrimitiveString'
    embeds_many :suffix, class_name: 'PrimitiveString'
    embeds_one :period, class_name: 'Period'

    def self.transform_json(json_hash, target=HumanName.new)
      result = self.superclass.transform_json(json_hash, target)
      result['use'] = NameUse.transform_json(json_hash['use']) unless json_hash['use'].nil?      
      result['text'] = PrimitiveString.transform_json(json_hash['text'], json_hash['_text']) unless json_hash['text'].nil?      
      result['family'] = PrimitiveString.transform_json(json_hash['family'], json_hash['_family']) unless json_hash['family'].nil?      
      result['given'] = json_hash['given'].each_with_index.map do |var, i|
        extension_hash = json_hash['_given'] && json_hash['_given'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['given'].nil?
      result['prefix'] = json_hash['prefix'].each_with_index.map do |var, i|
        extension_hash = json_hash['_prefix'] && json_hash['_prefix'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['prefix'].nil?
      result['suffix'] = json_hash['suffix'].each_with_index.map do |var, i|
        extension_hash = json_hash['_suffix'] && json_hash['_suffix'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['suffix'].nil?
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?      

      result
    end
  end
end
