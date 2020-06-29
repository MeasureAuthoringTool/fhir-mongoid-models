module FHIR
  # fhir/contract_term_security_label.rb
  class ContractTermSecurityLabel < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ContractTermSecurityLabel'
    embeds_many :number, class_name: 'PrimitiveUnsignedInt'
    embeds_one :classification, class_name: 'Coding'
    embeds_many :category, class_name: 'Coding'
    embeds_many :control, class_name: 'Coding'

    def self.transform_json(json_hash, target=ContractTermSecurityLabel.new)
      result = self.superclass.transform_json(json_hash, target)
      result['number'] = json_hash['number'].each_with_index.map do |var, i|
        extension_hash = json_hash['_number'] && json_hash['_number'][i]
        PrimitiveUnsignedInt.transform_json(var, extension_hash)
      end unless json_hash['number'].nil?
      result['classification'] = Coding.transform_json(json_hash['classification']) unless json_hash['classification'].nil?      
      result['category'] = json_hash['category'].map { |var| Coding.transform_json(var) } unless json_hash['category'].nil?
      result['control'] = json_hash['control'].map { |var| Coding.transform_json(var) } unless json_hash['control'].nil?

      result
    end
  end
end
