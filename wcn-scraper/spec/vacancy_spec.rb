require_relative 'spec_helper'

describe WcnScraper::Vacancy do
  let(:html) { <<~HTML
      <div xmlns="http://www.w3.org/1999/xhtml">Vacancy Title:201706: Prison Officer - HMP/YOI Downview<br/>
      Vacancy Id:9908<br/>
      Role Type:Operational Delivery,Prison Officer<br/>
      Salary:£31,453<br/>
      Location:Sutton <br/>
      Closing Date:7 Jul 2017 23:55 BST<br/>
      </div>
    HTML
  }

  let(:url) { 'https://justicejobs.tal.net/vx/mobile-0/appcentre-1/brand-13/candidate/so/pm/1/pl/3/opp/9908-201706-Prison-Officer-HMP-YOI-Downview/en-GB' }

  describe 'instantiating' do
    subject(:vacancy) { described_class.new(url, html) }

    specify { expect(vacancy.url).to eq(url) }
    specify { expect(vacancy.id).to eq('9908') }
    specify { expect(vacancy.role_type).to eq('Operational Delivery,Prison Officer') }
    specify { expect(vacancy.salary).to eq('£31,453') }
    specify { expect(vacancy.closing_date).to eq('7 Jul 2017') }

    specify { expect(vacancy.prison).to eq('HMP/YOI Downview') }
    specify { expect(vacancy.location.lat).to eq(51.3384631) }
    specify { expect(vacancy.location.lng).to eq(-0.1880442) }
  end
end
