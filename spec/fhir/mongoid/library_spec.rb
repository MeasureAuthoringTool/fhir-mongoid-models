RSpec.describe FHIR::Library do
  it 'Should be able to construct a library from library resource' do
    library_json = File.open(File.join(File.dirname(__FILE__), '../fixture/library.json'))
    library_hash = JSON.load library_json
    library = FHIR::Library.transform_json library_hash
    expect do
      library.save!
    end.to_not raise_error
    expect(library._id).to be_present
    expect(library.name.value).to eq library_hash['name']

    updated_library_json = library.to_json
    updated_library_hash =  JSON.load updated_library_json
    updated_library = FHIR::Library.transform_json updated_library_hash
    expect(updated_library).to be_present
    expect(updated_library_hash).to eq library_hash
  end
end
