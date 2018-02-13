#
# Copyright (c) 2015 - 2018 Luke Hackett
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

describe '/Mode Integration', type: :feature do
  let!(:authorised_mode)   { authorised_client.mode }
  let!(:unauthorised_mode) { unauthorised_client.mode }

  describe '#active_service_types' do
    context 'with an authorised client' do
      it 'should return all active service types' do
        VCR.use_cassette('mode/authorised_client_active_service_types') do
          modes = authorised_mode.active_service_types
          expect(modes).to be_kind_of(Array)
          expect(modes).to_not be_empty
        end
      end
    end

    context 'with an unauthorised client' do
      it 'should raise an exception' do
        VCR.use_cassette('mode/unauthorised_client_active_service_types') do
          expect {
            unauthorised_mode.active_service_types
          }.to raise_error(TflApi::Exceptions::ApiException)
        end
      end
    end
  end

  describe '#next_arrival' do
    context 'with an authorised client' do
      it 'should return all next arrival predictions for the given mode' do
        VCR.use_cassette('mode/authorised_client_next_arrival') do
          modes = authorised_mode.next_arrival('tube', 2)
          expect(modes).to be_kind_of(Array)
          expect(modes).to_not be_empty
        end
      end
    end

    context 'with an unauthorised client' do
      it 'should raise an exception' do
        VCR.use_cassette('mode/unauthorised_client_next_arrival') do
          expect {
            unauthorised_mode.next_arrival('tube', 2)
          }.to raise_error(TflApi::Exceptions::ApiException)
        end
      end
    end
  end

end