module FHIR
  # fhir/structure_definition.rb
  class StructureDefinition < DomainResource
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
    embeds_many :keyword, class_name: 'FHIR::Coding'    
    embeds_one :fhirVersion, class_name: 'FHIR::FHIRVersion'    
    embeds_many :mapping, class_name: 'FHIR::StructureDefinitionMapping'    
    embeds_one :kind, class_name: 'FHIR::StructureDefinitionKind'    
    embeds_one :abstract, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_many :context, class_name: 'FHIR::StructureDefinitionContext'    
    embeds_many :contextInvariant, class_name: 'FHIR::PrimitiveString'    
    embeds_one :type, class_name: 'FHIR::PrimitiveUri'    
    embeds_one :baseDefinition, class_name: 'FHIR::PrimitiveCanonical'    
    embeds_one :derivation, class_name: 'FHIR::TypeDerivationRule'    
    embeds_one :snapshot, class_name: 'FHIR::StructureDefinitionSnapshot'    
    embeds_one :differential, class_name: 'FHIR::StructureDefinitionDifferential'    

    def self.transform_json(json_hash, target = StructureDefinition.new)
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
      result['keyword'] = json_hash['keyword'].map { |var| Coding.transform_json(var) } unless json_hash['keyword'].nil?
      result['fhirVersion'] = FHIRVersion.transform_json(json_hash['fhirVersion']) unless json_hash['fhirVersion'].nil?
      result['mapping'] = json_hash['mapping'].map { |var| StructureDefinitionMapping.transform_json(var) } unless json_hash['mapping'].nil?
      result['kind'] = StructureDefinitionKind.transform_json(json_hash['kind']) unless json_hash['kind'].nil?
      result['abstract'] = PrimitiveBoolean.transform_json(json_hash['abstract'], json_hash['_abstract']) unless json_hash['abstract'].nil?
      result['context'] = json_hash['context'].map { |var| StructureDefinitionContext.transform_json(var) } unless json_hash['context'].nil?
      result['contextInvariant'] = json_hash['contextInvariant'].each_with_index.map do |var, i|
        extension_hash = json_hash['_contextInvariant'] && json_hash['_contextInvariant'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['contextInvariant'].nil?
      result['type'] = PrimitiveUri.transform_json(json_hash['type'], json_hash['_type']) unless json_hash['type'].nil?
      result['baseDefinition'] = PrimitiveCanonical.transform_json(json_hash['baseDefinition'], json_hash['_baseDefinition']) unless json_hash['baseDefinition'].nil?
      result['derivation'] = TypeDerivationRule.transform_json(json_hash['derivation']) unless json_hash['derivation'].nil?
      result['snapshot'] = StructureDefinitionSnapshot.transform_json(json_hash['snapshot']) unless json_hash['snapshot'].nil?
      result['differential'] = StructureDefinitionDifferential.transform_json(json_hash['differential']) unless json_hash['differential'].nil?

      result
    end
  end
end
