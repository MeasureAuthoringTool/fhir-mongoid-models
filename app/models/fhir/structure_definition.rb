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
    
    def as_json(*args)
      result = super      
      unless self.url.nil? 
        result['url'] = self.url.value
        serialized = Extension.serializePrimitiveExtension(self.url)            
        result['_url'] = serialized unless serialized.nil?
      end
      unless self.identifier.nil?  || !self.identifier.any? 
        result['identifier'] = self.identifier.map{ |x| x.as_json(*args) }
      end
      unless self.version.nil? 
        result['version'] = self.version.value
        serialized = Extension.serializePrimitiveExtension(self.version)            
        result['_version'] = serialized unless serialized.nil?
      end
      unless self.name.nil? 
        result['name'] = self.name.value
        serialized = Extension.serializePrimitiveExtension(self.name)            
        result['_name'] = serialized unless serialized.nil?
      end
      unless self.title.nil? 
        result['title'] = self.title.value
        serialized = Extension.serializePrimitiveExtension(self.title)            
        result['_title'] = serialized unless serialized.nil?
      end
      unless self.status.nil? 
        result['status'] = self.status.value
        serialized = Extension.serializePrimitiveExtension(self.status)            
        result['_status'] = serialized unless serialized.nil?
      end
      unless self.experimental.nil? 
        result['experimental'] = self.experimental.value
        serialized = Extension.serializePrimitiveExtension(self.experimental)            
        result['_experimental'] = serialized unless serialized.nil?
      end
      unless self.date.nil? 
        result['date'] = self.date.value
        serialized = Extension.serializePrimitiveExtension(self.date)            
        result['_date'] = serialized unless serialized.nil?
      end
      unless self.publisher.nil? 
        result['publisher'] = self.publisher.value
        serialized = Extension.serializePrimitiveExtension(self.publisher)            
        result['_publisher'] = serialized unless serialized.nil?
      end
      unless self.contact.nil?  || !self.contact.any? 
        result['contact'] = self.contact.map{ |x| x.as_json(*args) }
      end
      unless self.description.nil? 
        result['description'] = self.description.value
        serialized = Extension.serializePrimitiveExtension(self.description)            
        result['_description'] = serialized unless serialized.nil?
      end
      unless self.useContext.nil?  || !self.useContext.any? 
        result['useContext'] = self.useContext.map{ |x| x.as_json(*args) }
      end
      unless self.jurisdiction.nil?  || !self.jurisdiction.any? 
        result['jurisdiction'] = self.jurisdiction.map{ |x| x.as_json(*args) }
      end
      unless self.purpose.nil? 
        result['purpose'] = self.purpose.value
        serialized = Extension.serializePrimitiveExtension(self.purpose)            
        result['_purpose'] = serialized unless serialized.nil?
      end
      unless self.copyright.nil? 
        result['copyright'] = self.copyright.value
        serialized = Extension.serializePrimitiveExtension(self.copyright)            
        result['_copyright'] = serialized unless serialized.nil?
      end
      unless self.keyword.nil?  || !self.keyword.any? 
        result['keyword'] = self.keyword.map{ |x| x.as_json(*args) }
      end
      unless self.fhirVersion.nil? 
        result['fhirVersion'] = self.fhirVersion.value
        serialized = Extension.serializePrimitiveExtension(self.fhirVersion)            
        result['_fhirVersion'] = serialized unless serialized.nil?
      end
      unless self.mapping.nil?  || !self.mapping.any? 
        result['mapping'] = self.mapping.map{ |x| x.as_json(*args) }
      end
      unless self.kind.nil? 
        result['kind'] = self.kind.value
        serialized = Extension.serializePrimitiveExtension(self.kind)            
        result['_kind'] = serialized unless serialized.nil?
      end
      unless self.abstract.nil? 
        result['abstract'] = self.abstract.value
        serialized = Extension.serializePrimitiveExtension(self.abstract)            
        result['_abstract'] = serialized unless serialized.nil?
      end
      unless self.context.nil?  || !self.context.any? 
        result['context'] = self.context.map{ |x| x.as_json(*args) }
      end
      unless self.contextInvariant.nil?  || !self.contextInvariant.any? 
        result['contextInvariant'] = self.contextInvariant.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.contextInvariant)                              
        result['_contextInvariant'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.type.nil? 
        result['type'] = self.type.value
        serialized = Extension.serializePrimitiveExtension(self.type)            
        result['_type'] = serialized unless serialized.nil?
      end
      unless self.baseDefinition.nil? 
        result['baseDefinition'] = self.baseDefinition.value
        serialized = Extension.serializePrimitiveExtension(self.baseDefinition)            
        result['_baseDefinition'] = serialized unless serialized.nil?
      end
      unless self.derivation.nil? 
        result['derivation'] = self.derivation.value
        serialized = Extension.serializePrimitiveExtension(self.derivation)            
        result['_derivation'] = serialized unless serialized.nil?
      end
      unless self.snapshot.nil? 
        result['snapshot'] = self.snapshot.as_json(*args)
      end
      unless self.differential.nil? 
        result['differential'] = self.differential.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = StructureDefinition.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['url'] = PrimitiveUri.transform_json(json_hash['url'], json_hash['_url']) unless json_hash['url'].nil?
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['version'] = PrimitiveString.transform_json(json_hash['version'], json_hash['_version']) unless json_hash['version'].nil?
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?
      result['title'] = PrimitiveString.transform_json(json_hash['title'], json_hash['_title']) unless json_hash['title'].nil?
      result['status'] = PublicationStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
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
      result['fhirVersion'] = FHIRVersion.transform_json(json_hash['fhirVersion'], json_hash['_fhirVersion']) unless json_hash['fhirVersion'].nil?
      result['mapping'] = json_hash['mapping'].map { |var| StructureDefinitionMapping.transform_json(var) } unless json_hash['mapping'].nil?
      result['kind'] = StructureDefinitionKind.transform_json(json_hash['kind'], json_hash['_kind']) unless json_hash['kind'].nil?
      result['abstract'] = PrimitiveBoolean.transform_json(json_hash['abstract'], json_hash['_abstract']) unless json_hash['abstract'].nil?
      result['context'] = json_hash['context'].map { |var| StructureDefinitionContext.transform_json(var) } unless json_hash['context'].nil?
      result['contextInvariant'] = json_hash['contextInvariant'].each_with_index.map do |var, i|
        extension_hash = json_hash['_contextInvariant'] && json_hash['_contextInvariant'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['contextInvariant'].nil?
      result['type'] = PrimitiveUri.transform_json(json_hash['type'], json_hash['_type']) unless json_hash['type'].nil?
      result['baseDefinition'] = PrimitiveCanonical.transform_json(json_hash['baseDefinition'], json_hash['_baseDefinition']) unless json_hash['baseDefinition'].nil?
      result['derivation'] = TypeDerivationRule.transform_json(json_hash['derivation'], json_hash['_derivation']) unless json_hash['derivation'].nil?
      result['snapshot'] = StructureDefinitionSnapshot.transform_json(json_hash['snapshot']) unless json_hash['snapshot'].nil?
      result['differential'] = StructureDefinitionDifferential.transform_json(json_hash['differential']) unless json_hash['differential'].nil?

      result
    end
  end
end
