require 'technical-analysis'
require 'spec_helper'

describe 'Indicators' do
  describe "CMF" do
    input_data = SpecHelper.get_test_data(:high, :low, :close, :volume)

    describe 'Chaikin Money Flow' do
      it 'Calculates CMF (20 day)' do
        output = TechnicalAnalysis::Cmf.calculate(input_data, period: 20)

        expected_output = [
          {:date=>"2018/11/05", :value=>0.010519910116535688},
          {:date=>"2018/11/06", :value=>-0.002328367522189358},
          {:date=>"2018/11/07", :value=>0.0839939173853672},
          {:date=>"2018/11/08", :value=>0.11517576782439708},
          {:date=>"2018/11/09", :value=>0.08638139363431603},
          {:date=>"2018/11/12", :value=>0.06492697386482489},
          {:date=>"2018/11/13", :value=>-0.00325588286845078},
          {:date=>"2018/11/14", :value=>-0.06224056395025631},
          {:date=>"2018/11/15", :value=>-0.016262278292090777},
          {:date=>"2018/11/16", :value=>0.004132959703610273},
          {:date=>"2018/11/19", :value=>-0.02107439975862456},
          {:date=>"2018/11/20", :value=>-0.09451983283878523},
          {:date=>"2018/11/21", :value=>-0.0864519745264971},
          {:date=>"2018/11/23", :value=>-0.12097582444999905},
          {:date=>"2018/11/26", :value=>-0.07707518115228632},
          {:date=>"2018/11/27", :value=>-0.039334642581608396},
          {:date=>"2018/11/28", :value=>-0.008559410227273146},
          {:date=>"2018/11/29", :value=>-0.02808273355873217},
          {:date=>"2018/11/30", :value=>-0.08707816577338795},
          {:date=>"2018/12/03", :value=>0.006195178249247199},
          {:date=>"2018/12/04", :value=>-0.044697234566322144},
          {:date=>"2018/12/06", :value=>-0.008556645577315109},
          {:date=>"2018/12/07", :value=>-0.09289096149170357},
          {:date=>"2018/12/10", :value=>-0.02994416009907359},
          {:date=>"2018/12/11", :value=>-0.05299093511730075},
          {:date=>"2018/12/12", :value=>-0.041279122544240626},
          {:date=>"2018/12/13", :value=>-0.005177700749048257},
          {:date=>"2018/12/14", :value=>0.008829457014340984},
          {:date=>"2018/12/17", :value=>-0.0635610565928198},
          {:date=>"2018/12/18", :value=>-0.08160027269601758},
          {:date=>"2018/12/19", :value=>-0.07883316711924936},
          {:date=>"2018/12/20", :value=>-0.08053545285645361},
          {:date=>"2018/12/21", :value=>-0.12311876857928804},
          {:date=>"2018/12/24", :value=>-0.13433878933016613},
          {:date=>"2018/12/26", :value=>-0.11185040161958644},
          {:date=>"2018/12/27", :value=>-0.09771633750350824},
          {:date=>"2018/12/28", :value=>-0.14870217725852253},
          {:date=>"2018/12/31", :value=>-0.1421967277504723},
          {:date=>"2019/01/02", :value=>-0.1171779554311941},
          {:date=>"2019/01/03", :value=>-0.23384083275693518},
          {:date=>"2019/01/04", :value=>-0.14338098793972473},
          {:date=>"2019/01/07", :value=>-0.16209459049078995},
          {:date=>"2019/01/08", :value=>-0.10900349402409147},
          {:date=>"2019/01/09", :value=>-0.14148236474171028}
        ]

        expect(output).to eq(expected_output)
      end

      it "Throws exception if not enough data" do
        expect {TechnicalAnalysis::Cmf.calculate(input_data, period: input_data.size+1)}.to raise_exception(Validation::ValidationError)
      end
    end
  end
end
