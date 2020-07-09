module FHIR
  # fhir/bundle.rb
  class Bundle < Resource
    include Mongoid::Document
    embeds_one :identifier, class_name: 'FHIR::Identifier'
    embeds_one :type, class_name: 'FHIR::BundleType'
    embeds_one :timestamp, class_name: 'FHIR::PrimitiveInstant'
    embeds_one :total, class_name: 'FHIR::PrimitiveUnsignedInt'
    embeds_many :link, class_name: 'FHIR::BundleLink'
    embeds_many :entry, class_name: 'FHIR::BundleEntry'
    embeds_one :signature, class_name: 'FHIR::Signature'

    def self.transform_json(json_hash, target = Bundle.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = Identifier.transform_json(json_hash['identifier']) unless json_hash['identifier'].nil?      
      result['type'] = BundleType.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['timestamp'] = PrimitiveInstant.transform_json(json_hash['timestamp'], json_hash['_timestamp']) unless json_hash['timestamp'].nil?      
      result['total'] = PrimitiveUnsignedInt.transform_json(json_hash['total'], json_hash['_total']) unless json_hash['total'].nil?      
      result['link'] = json_hash['link'].map { |var| BundleLink.transform_json(var) } unless json_hash['link'].nil?
      result['entry'] = json_hash['entry'].map { |var| BundleEntry.transform_json(var) } unless json_hash['entry'].nil?
      result['signature'] = Signature.transform_json(json_hash['signature']) unless json_hash['signature'].nil?      

      result
    end
  end
end
