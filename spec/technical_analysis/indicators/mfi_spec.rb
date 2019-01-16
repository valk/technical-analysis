require 'technical-analysis'
require 'spec_helper'

describe 'Indicators' do
  describe "MFI" do
    input_data = SpecHelper.get_test_data(:high, :low, :close, :volume)

    describe 'Money Flow Index' do
      it 'Calculates MFI (14 day)' do
        output = TechnicalAnalysis::Mfi.calculate(input_data, period: 14)

        expected_output = [
          {:date=>"2018/10/29", :value=>35.973926377719295},
          {:date=>"2018/10/30", :value=>36.38768375444253},
          {:date=>"2018/10/31", :value=>45.214622261116865},
          {:date=>"2018/11/01", :value=>46.69168911629936},
          {:date=>"2018/11/02", :value=>41.95906812943111},
          {:date=>"2018/11/05", :value=>34.78216906343063},
          {:date=>"2018/11/06", :value=>35.50426811855657},
          {:date=>"2018/11/07", :value=>40.83081970751587},
          {:date=>"2018/11/08", :value=>39.93886476277229},
          {:date=>"2018/11/09", :value=>34.82129345577579},
          {:date=>"2018/11/12", :value=>34.42914208336833},
          {:date=>"2018/11/13", :value=>34.34229761188338},
          {:date=>"2018/11/14", :value=>28.384945303826555},
          {:date=>"2018/11/15", :value=>35.21136683265594},
          {:date=>"2018/11/16", :value=>41.22749344358184},
          {:date=>"2018/11/19", :value=>41.216526023725},
          {:date=>"2018/11/20", :value=>33.960148214906965},
          {:date=>"2018/11/21", :value=>26.562703378271138},
          {:date=>"2018/11/23", :value=>30.0162422598642},
          {:date=>"2018/11/26", :value=>31.547361595662196},
          {:date=>"2018/11/27", :value=>31.964707056845796},
          {:date=>"2018/11/28", :value=>32.76065853310956},
          {:date=>"2018/11/29", :value=>34.06816082393442},
          {:date=>"2018/11/30", :value=>34.05798943239071},
          {:date=>"2018/12/03", :value=>41.56028762200471},
          {:date=>"2018/12/04", :value=>42.20999531156955},
          {:date=>"2018/12/06", :value=>43.83608665179891},
          {:date=>"2018/12/07", :value=>36.043235982173},
          {:date=>"2018/12/10", :value=>28.368262151706787},
          {:date=>"2018/12/11", :value=>35.65846689890073},
          {:date=>"2018/12/12", :value=>43.77747404533765},
          {:date=>"2018/12/13", :value=>49.219385053554596},
          {:date=>"2018/12/14", :value=>47.94902504034211},
          {:date=>"2018/12/17", :value=>48.23034273673764},
          {:date=>"2018/12/18", :value=>47.447534147092476},
          {:date=>"2018/12/19", :value=>39.506183778454634},
          {:date=>"2018/12/20", :value=>31.23926122664477},
          {:date=>"2018/12/21", :value=>29.111701049682864},
          {:date=>"2018/12/24", :value=>22.795547568232564},
          {:date=>"2018/12/26", :value=>30.54886108664553},
          {:date=>"2018/12/27", :value=>37.56125308902594},
          {:date=>"2018/12/28", :value=>43.66248537462054},
          {:date=>"2018/12/31", :value=>50.84666407662511},
          {:date=>"2019/01/02", :value=>44.40322811326429},
          {:date=>"2019/01/03", :value=>36.12141791144509},
          {:date=>"2019/01/04", :value=>37.81171947764313},
          {:date=>"2019/01/07", :value=>44.40424662233335},
          {:date=>"2019/01/08", :value=>50.1757147722236},
          {:date=>"2019/01/09", :value=>50.72343663578981}
        ]

        expect(output).to eq(expected_output)
      end

      it "Throws exception if not enough data" do
        expect {TechnicalAnalysis::Mfi.calculate(input_data, period: input_data.size+2)}.to raise_exception(Validation::ValidationError)
      end
    end
  end
end
