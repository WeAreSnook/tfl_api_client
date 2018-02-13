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

module TflApi
  class Client
    # This class communicates with the TFL "/Journey" API to obtain
    # details about taxis and minicabs contact information.
    #
    class Mode

      # Initialize the Mode object and store the reference to Client object
      #
      # @param client [Client] the client object
      #
      # @return [Mode] the Mode object
      #
      def initialize(client)
        @client = client
      end

      # Returns the service type active for a mode.
      #
      # @return [Array] An array of service types that are active for a mode
      #
      def active_service_types
        @client.get('/Mode/ActiveServiceTypes')
      end

      # Returns the next arrival predictions for all stops of a given mode
      #
      # @param mode [String] A mode name e.g. tube, dlr
      # @param count [Integer] Number of arrivals to return for each stop
      #
      # @return [Array] An array of arrival predictions for all stops of a given mode
      #
      def next_arrival(mode, count = -1)
        @client.get("/Mode/#{mode}/Arrivals", { count: count })
      end

    end
  end
end
