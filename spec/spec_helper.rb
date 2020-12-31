#
# Author:: Fletcher Nichol (<fnichol@nichol.ca>)
#
# Copyright (C) 2012, Fletcher Nichol
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

gem "minitest"
gem "minitest-stub-const"

if ENV["CODECLIMATE_REPO_TOKEN"]
  require "codeclimate-test-reporter"
  CodeClimate::TestReporter.start
elsif ENV["COVERAGE"]
  require "simplecov"
  SimpleCov.profiles.define "gem" do
    command_name "Specs"

    add_filter ".gem/"
    add_filter "/spec/"
    add_filter "/lib/vendor/"

    add_group "Libraries", "/lib/"
  end
  SimpleCov.start "gem"
end

require "minitest"
require "minitest/stub_const"
require "minitest/autorun"
require "mocha/setup"
require "tempfile" unless defined?(Tempfile)
