require_relative 'spec_helper'

describe WcnScraper::Location do
  describe 'instantiating' do
    subject(:location) { described_class.new('HMP Eastwood Park') }

    specify { expect(location.lat).to eq(51.63504709999999) }
    specify { expect(location.lng).to eq(-2.468383) }
  end
end
