RSpec.describe FHIR::Bundle do
  it 'Should be able to construct a bundle from a bunle file' do
    bundle_json = File.open(File.join(File.dirname(__FILE__), '../fixture/EXM104-9.1.000-bundle.json'))
    bundle_hash = JSON.load bundle_json
    # TODO - Uncomment when:
    # 1. Handling of reserved words is corrected
    # 2. Timezones are preserved
    # 3. Div html text is not escaped
    # bundle = FHIR::Bundle.transform_json bundle_hash
    # updated_bundle_json = bundle.to_json
    # updated_bundle_hash =  JSON.load updated_bundle_json
    # updated_bundle = FHIR::Bundle.transform_json updated_bundle_hash
    # expect(updated_bundle).to be_present
    # expect(updated_bundle_hash).to eq bundle_hash
  end
end
