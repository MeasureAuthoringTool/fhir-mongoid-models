module FHIR
  # fhir/naming_system.rb
  class NamingSystem < DomainResource
    include Mongoid::Document
    embeds_one :name, class_name: 'PrimitiveString'
    embeds_one :status, class_name: 'PublicationStatus'
    embeds_one :kind, class_name: 'NamingSystemType'
    embeds_one :date, class_name: 'PrimitiveDateTime'
    embeds_one :publisher, class_name: 'PrimitiveString'
    embeds_many :contact, class_name: 'ContactDetail'
    embeds_one :responsible, class_name: 'PrimitiveString'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :description, class_name: 'PrimitiveMarkdown'
    embeds_many :useContext, class_name: 'UsageContext'
    embeds_many :jurisdiction, class_name: 'CodeableConcept'
    embeds_one :usage, class_name: 'PrimitiveString'
    embeds_many :uniqueId, class_name: 'NamingSystemUniqueId'

    def self.transform_json(json_hash, target = NamingSystem.new)
      result = self.superclass.transform_json(json_hash, target)
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?      
      result['status'] = PublicationStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['kind'] = NamingSystemType.transform_json(json_hash['kind']) unless json_hash['kind'].nil?      
      result['date'] = PrimitiveDateTime.transform_json(json_hash['date'], json_hash['_date']) unless json_hash['date'].nil?      
      result['publisher'] = PrimitiveString.transform_json(json_hash['publisher'], json_hash['_publisher']) unless json_hash['publisher'].nil?      
      result['contact'] = json_hash['contact'].map { |var| ContactDetail.transform_json(var) } unless json_hash['contact'].nil?
      result['responsible'] = PrimitiveString.transform_json(json_hash['responsible'], json_hash['_responsible']) unless json_hash['responsible'].nil?      
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['description'] = PrimitiveMarkdown.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['useContext'] = json_hash['useContext'].map { |var| UsageContext.transform_json(var) } unless json_hash['useContext'].nil?
      result['jurisdiction'] = json_hash['jurisdiction'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['jurisdiction'].nil?
      result['usage'] = PrimitiveString.transform_json(json_hash['usage'], json_hash['_usage']) unless json_hash['usage'].nil?      
      result['uniqueId'] = json_hash['uniqueId'].map { |var| NamingSystemUniqueId.transform_json(var) } unless json_hash['uniqueId'].nil?

      result
    end
  end
end
