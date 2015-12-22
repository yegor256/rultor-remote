# encoding: utf-8
#
# Copyright (c) 2009-2014, rultor.com
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met: 1) Redistributions of source code must retain the above
# copyright notice, this list of conditions and the following
# disclaimer. 2) Redistributions in binary form must reproduce the above
# copyright notice, this list of conditions and the following
# disclaimer in the documentation and/or other materials provided
# with the distribution. 3) Neither the name of the rultor.com nor
# the names of its contributors may be used to endorse or promote
# products derived from this software without specific prior written
# permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT
# NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
# FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
# THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
# INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
# HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
# STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
# OF THE POSSIBILITY OF SUCH DAMAGE.

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rultor/version'

Gem::Specification.new do |s|
  s.specification_version = 2 if s.respond_to? :specification_version=
  if s.respond_to? :required_rubygems_version=
    s.required_rubygems_version = Gem::Requirement.new('>= 0')
  end
  s.rubygems_version = '2.2.2'
  s.required_ruby_version = '>= 1.9.3'
  s.name = 'rultor'
  s.version = Rultor::VERSION
  s.license = 'BSD'
  s.summary = 'Rultor.com Remote Control'
  s.description = 'Command line remote control of www.rultor.com'
  s.authors = ['Yegor Bugayenko']
  s.email = 'yegor@teamed.io'
  s.homepage = 'http://github.com/yegor256/rultor-remote'
  s.files = `git ls-files`.split($RS)
  s.executables = s.files.grep(%r{^bin\/}) { |f| File.basename(f) }
  s.test_files = s.files.grep(%r{^(test|spec|features)\/})
  s.rdoc_options = ['--charset=UTF-8']
  s.extra_rdoc_files = %w(README.md LICENSE.txt)
  s.add_runtime_dependency 'slop', '~> 3.6'
  s.add_development_dependency 'rake', '~> 10.4.2'
  s.add_development_dependency 'coveralls', '~> 0.7', '>= 0.7.0'
  s.add_development_dependency 'rdoc', '~> 3.11'
  s.add_development_dependency 'cucumber', '1.3.11'
  s.add_development_dependency 'minitest', '~> 5.4', '>= 5.4.0'
  s.add_development_dependency 'rubocop', '~> 0.24', '>= 0.24.1'
  s.add_development_dependency 'rubocop-rspec', '~> 1.1', '>= 1.1.0'
  s.add_development_dependency 'rspec-rails', '~> 2.13'
end
