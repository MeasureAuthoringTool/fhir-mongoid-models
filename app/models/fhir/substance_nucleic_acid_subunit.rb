module FHIR
  # fhir/substance_nucleic_acid_subunit.rb
  class SubstanceNucleicAcidSubunit < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SubstanceNucleicAcidSubunit'
    embeds_one :subunit, class_name: 'PrimitiveInteger'
    embeds_one :sequence, class_name: 'PrimitiveString'
    embeds_one :length, class_name: 'PrimitiveInteger'
    embeds_one :sequenceAttachment, class_name: 'Attachment'
    embeds_one :fivePrime, class_name: 'CodeableConcept'
    embeds_one :threePrime, class_name: 'CodeableConcept'
    embeds_many :linkage, class_name: 'SubstanceNucleicAcidSubunitLinkage'
    embeds_many :sugar, class_name: 'SubstanceNucleicAcidSubunitSugar'

    def self.transform_json(json_hash, target=SubstanceNucleicAcidSubunit.new)
      result = self.superclass.transform_json(json_hash, target)
      result['subunit'] = PrimitiveInteger.transform_json(json_hash['subunit'], json_hash['_subunit']) unless json_hash['subunit'].nil?      
      result['sequence'] = PrimitiveString.transform_json(json_hash['sequence'], json_hash['_sequence']) unless json_hash['sequence'].nil?      
      result['length'] = PrimitiveInteger.transform_json(json_hash['length'], json_hash['_length']) unless json_hash['length'].nil?      
      result['sequenceAttachment'] = Attachment.transform_json(json_hash['sequenceAttachment']) unless json_hash['sequenceAttachment'].nil?      
      result['fivePrime'] = CodeableConcept.transform_json(json_hash['fivePrime']) unless json_hash['fivePrime'].nil?      
      result['threePrime'] = CodeableConcept.transform_json(json_hash['threePrime']) unless json_hash['threePrime'].nil?      
      result['linkage'] = json_hash['linkage'].map { |var| SubstanceNucleicAcidSubunitLinkage.transform_json(var) } unless json_hash['linkage'].nil?
      result['sugar'] = json_hash['sugar'].map { |var| SubstanceNucleicAcidSubunitSugar.transform_json(var) } unless json_hash['sugar'].nil?

      result
    end
  end
end
