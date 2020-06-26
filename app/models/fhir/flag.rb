module FHIR
  # fhir/flag.rb
  class Flag < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'Flag'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'FlagStatus'
    embeds_many :category, class_name: 'CodeableConcept'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_one :subject, class_name: 'Reference'
    embeds_one :period, class_name: 'Period'
    embeds_one :encounter, class_name: 'Reference'
    embeds_one :author, class_name: 'Reference'

    def self.transform_json(json_hash)
      result = Flag.new
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['status'] = FlagStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['category'] = json_hash['category'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['category'].nil?
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?      
      result['subject'] = Reference.transform_json(json_hash['subject']) unless json_hash['subject'].nil?      
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?      
      result['encounter'] = Reference.transform_json(json_hash['encounter']) unless json_hash['encounter'].nil?      
      result['author'] = Reference.transform_json(json_hash['author']) unless json_hash['author'].nil?      

      result
    end
  end
end
