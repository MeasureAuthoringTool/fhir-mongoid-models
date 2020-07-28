module FHIR
  # fhir/structure_map.rb
  class StructureMap < DomainResource
    include Mongoid::Document
    embeds_one :url, class_name: 'FHIR::PrimitiveUri'    
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :version, class_name: 'FHIR::PrimitiveString'    
    embeds_one :name, class_name: 'FHIR::PrimitiveString'    
    embeds_one :title, class_name: 'FHIR::PrimitiveString'    
    embeds_one :status, class_name: 'FHIR::PublicationStatus'    
    embeds_one :experimental, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :date, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :publisher, class_name: 'FHIR::PrimitiveString'    
    embeds_many :contact, class_name: 'FHIR::ContactDetail'    
    embeds_one :description, class_name: 'FHIR::PrimitiveMarkdown'    
    embeds_many :useContext, class_name: 'FHIR::UsageContext'    
    embeds_many :jurisdiction, class_name: 'FHIR::CodeableConcept'    
    embeds_one :purpose, class_name: 'FHIR::PrimitiveMarkdown'    
    embeds_one :copyright, class_name: 'FHIR::PrimitiveMarkdown'    
    embeds_many :structure, class_name: 'FHIR::StructureMapStructure'    
    embeds_many :import, class_name: 'FHIR::PrimitiveCanonical'    
    embeds_many :group, class_name: 'FHIR::StructureMapGroup'    

    def self.transform_json(json_hash, target = StructureMap.new)
      result = self.superclass.transform_json(json_hash, target)
      result['url'] = PrimitiveUri.transform_json(json_hash['url'], json_hash['_url']) unless json_hash['url'].nil?
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['version'] = PrimitiveString.transform_json(json_hash['version'], json_hash['_version']) unless json_hash['version'].nil?
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?
      result['title'] = PrimitiveString.transform_json(json_hash['title'], json_hash['_title']) unless json_hash['title'].nil?
      result['status'] = PublicationStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?
      result['experimental'] = PrimitiveBoolean.transform_json(json_hash['experimental'], json_hash['_experimental']) unless json_hash['experimental'].nil?
      result['date'] = PrimitiveDateTime.transform_json(json_hash['date'], json_hash['_date']) unless json_hash['date'].nil?
      result['publisher'] = PrimitiveString.transform_json(json_hash['publisher'], json_hash['_publisher']) unless json_hash['publisher'].nil?
      result['contact'] = json_hash['contact'].map { |var| ContactDetail.transform_json(var) } unless json_hash['contact'].nil?
      result['description'] = PrimitiveMarkdown.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['useContext'] = json_hash['useContext'].map { |var| UsageContext.transform_json(var) } unless json_hash['useContext'].nil?
      result['jurisdiction'] = json_hash['jurisdiction'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['jurisdiction'].nil?
      result['purpose'] = PrimitiveMarkdown.transform_json(json_hash['purpose'], json_hash['_purpose']) unless json_hash['purpose'].nil?
      result['copyright'] = PrimitiveMarkdown.transform_json(json_hash['copyright'], json_hash['_copyright']) unless json_hash['copyright'].nil?
      result['structure'] = json_hash['structure'].map { |var| StructureMapStructure.transform_json(var) } unless json_hash['structure'].nil?
      result['import'] = json_hash['import'].each_with_index.map do |var, i|
        extension_hash = json_hash['_import'] && json_hash['_import'][i]
        PrimitiveCanonical.transform_json(var, extension_hash)
      end unless json_hash['import'].nil?
      result['group'] = json_hash['group'].map { |var| StructureMapGroup.transform_json(var) } unless json_hash['group'].nil?

      result
    end
  end
end
