#
# Copyright (c) 2015 - 2017 Luke Hackett
#
# MIT License
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#

require_relative '../spec_helper'

describe '/Journey Integration', type: :feature do
  let!(:authorised_journey)   { authorised_client.journey }
  let!(:unauthorised_journey) { unauthorised_client.journey }

  describe '#modes' do
    context 'with an authorised client' do
      it 'should return all journey modes' do
        VCR.use_cassette('journey/authorised_client_modes') do
          modes = authorised_journey.modes
          expect(modes).to be_kind_of(Array)
          expect(modes).to_not be_empty
        end
      end
    end

    context 'with an unauthorised client' do
      it 'should raise an exception' do
        VCR.use_cassette('journey/unauthorised_client_modes') do
          expect {
            unauthorised_journey.modes
          }.to raise_error(TflApi::Exceptions::ApiException)
        end
      end
    end
  end

  describe '#planner' do
    let(:from) { '51.5007292,-0.1246254' }
    let(:to) { 'Piccadilly Circus Station' }
    let(:options) { { nationalSearch: false } }

    context 'with an authorised client' do
      it 'should a valid route plan' do
        VCR.use_cassette('journey/authorised_client_planner') do
          modes = authorised_journey.planner(from, to, options)
          expect(modes).to be_kind_of(Hash)
        end
      end
    end

    context 'with an unauthorised client' do
      it 'should raise an exception' do
        VCR.use_cassette('journey/unauthorised_client_planner') do
          expect {
            unauthorised_journey.planner(from, to, options)
          }.to raise_error(TflApi::Exceptions::ApiException)
        end
      end
    end
  end

end