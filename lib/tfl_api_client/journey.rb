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
    class Journey

      # Initialize the Journey object and store the reference to Client object
      #
      # @param client [Client] the client object
      #
      # @return [Journey] the Journey object
      #
      def initialize(client)
        @client = client
      end

      # Gets a list of all of the available journey planner modes.
      #
      # @return [Array] An array of all available journey planner modes
      #
      def modes
        @client.get('/Journey/Meta/Modes')
      end

      # Perform a Journey Planner search from the parameters specified in
      # simple types.
      #
      # @param from [String] the origin of the journey
      # @param to   [String] the destination of the journey
      #
      # @return [Hash] A hash of planner journey results
      #
      def planner(from, to, params={})
        @client.get("/Journey/JourneyResults/#{from}/to/#{to}", params)
      end

    end
  end
end
