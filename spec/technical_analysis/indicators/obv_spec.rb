require 'technical-analysis'
require 'spec_helper'

describe 'Indicators' do
  describe "OBV" do
    input_data = SpecHelper.get_test_data(:close, :volume)

    describe 'On-balance Volume' do
      it 'Calculates OBV' do
        output = TechnicalAnalysis::Obv.calculate(input_data)

        expected_output = [
          {:date=>"2018/10/09", :value=>0},
          {:date=>"2018/10/10", :value=>-41084070},
          {:date=>"2018/10/11", :value=>-93986390},
          {:date=>"2018/10/12", :value=>-54491620},
          {:date=>"2018/10/15", :value=>-84772070},
          {:date=>"2018/10/16", :value=>-55969520},
          {:date=>"2018/10/17", :value=>-78662400},
          {:date=>"2018/10/18", :value=>-111051680},
          {:date=>"2018/10/19", :value=>-78177350},
          {:date=>"2018/10/22", :value=>-49425810},
          {:date=>"2018/10/23", :value=>-10744640},
          {:date=>"2018/10/24", :value=>-50736760},
          {:date=>"2018/10/25", :value=>-21709420},
          {:date=>"2018/10/26", :value=>-68901120},
          {:date=>"2018/10/29", :value=>-114614810},
          {:date=>"2018/10/30", :value=>-78126880},
          {:date=>"2018/10/31", :value=>-40110070},
          {:date=>"2018/11/01", :value=>12844000},
          {:date=>"2018/11/02", :value=>-78202560},
          {:date=>"2018/11/05", :value=>-144274730},
          {:date=>"2018/11/06", :value=>-112500010},
          {:date=>"2018/11/07", :value=>-79208370},
          {:date=>"2018/11/08", :value=>-104497640},
          {:date=>"2018/11/09", :value=>-138815400},
          {:date=>"2018/11/12", :value=>-189806430},
          {:date=>"2018/11/13", :value=>-236532140},
          {:date=>"2018/11/14", :value=>-297079480},
          {:date=>"2018/11/15", :value=>-250807820},
          {:date=>"2018/11/16", :value=>-214616490},
          {:date=>"2018/11/19", :value=>-256243310},
          {:date=>"2018/11/20", :value=>-323921990},
          {:date=>"2018/11/21", :value=>-355018230},
          {:date=>"2018/11/23", :value=>-378642200},
          {:date=>"2018/11/26", :value=>-333979880},
          {:date=>"2018/11/27", :value=>-375136020},
          {:date=>"2018/11/28", :value=>-329194270},
          {:date=>"2018/11/29", :value=>-370717850},
          {:date=>"2018/11/30", :value=>-410142110},
          {:date=>"2018/12/03", :value=>-369604410},
          {:date=>"2018/12/04", :value=>-410745660},
          {:date=>"2018/12/06", :value=>-453450570},
          {:date=>"2018/12/07", :value=>-495129250},
          {:date=>"2018/12/10", :value=>-433370250},
          {:date=>"2018/12/11", :value=>-479338290},
          {:date=>"2018/12/12", :value=>-443863610},
          {:date=>"2018/12/13", :value=>-412109400},
          {:date=>"2018/12/14", :value=>-452729760},
          {:date=>"2018/12/17", :value=>-495980180},
          {:date=>"2018/12/18", :value=>-462226690},
          {:date=>"2018/12/19", :value=>-509824360},
          {:date=>"2018/12/20", :value=>-574222590},
          {:date=>"2018/12/21", :value=>-669720490},
          {:date=>"2018/12/24", :value=>-706889720},
          {:date=>"2018/12/26", :value=>-648755870},
          {:date=>"2018/12/27", :value=>-700364720},
          {:date=>"2018/12/28", :value=>-658624120},
          {:date=>"2018/12/31", :value=>-624124730},
          {:date=>"2019/01/02", :value=>-588487660},
          {:date=>"2019/01/03", :value=>-679594500},
          {:date=>"2019/01/04", :value=>-622170850},
          {:date=>"2019/01/07", :value=>-676742290},
          {:date=>"2019/01/08", :value=>-636119380},
          {:date=>"2019/01/09", :value=>-591085010}
        ]

        expect(output).to eq(expected_output)
      end

      it "Throws exception if not enough data" do
        expect {TechnicalAnalysis::Obv.calculate([])}.to raise_exception(Validation::ValidationError)
      end
    end
  end
end
