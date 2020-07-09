module FHIR
  # fhir/substance_protein_subunit.rb
  class SubstanceProteinSubunit < BackboneElement
    include Mongoid::Document
    embeds_one :subunit, class_name: 'FHIR::PrimitiveInteger'
    embeds_one :sequence, class_name: 'FHIR::PrimitiveString'
    embeds_one :length, class_name: 'FHIR::PrimitiveInteger'
    embeds_one :sequenceAttachment, class_name: 'FHIR::Attachment'
    embeds_one :nTerminalModificationId, class_name: 'FHIR::Identifier'
    embeds_one :nTerminalModification, class_name: 'FHIR::PrimitiveString'
    embeds_one :cTerminalModificationId, class_name: 'FHIR::Identifier'
    embeds_one :cTerminalModification, class_name: 'FHIR::PrimitiveString'

    def self.transform_json(json_hash, target = SubstanceProteinSubunit.new)
      result = self.superclass.transform_json(json_hash, target)
      result['subunit'] = PrimitiveInteger.transform_json(json_hash['subunit'], json_hash['_subunit']) unless json_hash['subunit'].nil?      
      result['sequence'] = PrimitiveString.transform_json(json_hash['sequence'], json_hash['_sequence']) unless json_hash['sequence'].nil?      
      result['length'] = PrimitiveInteger.transform_json(json_hash['length'], json_hash['_length']) unless json_hash['length'].nil?      
      result['sequenceAttachment'] = Attachment.transform_json(json_hash['sequenceAttachment']) unless json_hash['sequenceAttachment'].nil?      
      result['nTerminalModificationId'] = Identifier.transform_json(json_hash['nTerminalModificationId']) unless json_hash['nTerminalModificationId'].nil?      
      result['nTerminalModification'] = PrimitiveString.transform_json(json_hash['nTerminalModification'], json_hash['_nTerminalModification']) unless json_hash['nTerminalModification'].nil?      
      result['cTerminalModificationId'] = Identifier.transform_json(json_hash['cTerminalModificationId']) unless json_hash['cTerminalModificationId'].nil?      
      result['cTerminalModification'] = PrimitiveString.transform_json(json_hash['cTerminalModification'], json_hash['_cTerminalModification']) unless json_hash['cTerminalModification'].nil?      

      result
    end
  end
end
