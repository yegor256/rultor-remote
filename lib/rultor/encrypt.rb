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

require 'shellwords'
require 'English'

# Rultor main module.
# Author:: Yegor Bugayenko (yegor@teamed.io)
# Copyright:: Copyright (c) 2014 Yegor Bugayenko
# License:: BSD
module Rultor
  # Encrypting command
  class Encrypt
    def initialize(name, file)
      @key = 'rultor-key:' + name
      @dir = File.dirname(file)
      @file = File.basename(file)
    end

    def run
      source = File.join(@dir, @file)
      target = File.join(@dir, @file + '.asc')
      if Gem.win_platform?
        windows(source, target)
      else
        unix(source, target)
      end
      fail 'PGP encryption failed' unless $CHILD_STATUS.exitstatus == 0
      Rultor.log.info "#{@file} encrypted into #{target}" \
        " (#{File.size(target)} bytes)"
    end

    private

    def unix(source, target)
      system(
        "
        set -x
        set -e
        file=#{Shellwords.escape(source)}
        asc=#{Shellwords.escape(target)}
        if [ -e \"${asc}\" ]; then
          echo \"file already exists: ${asc}\"
          exit -1
        fi
        tmp=$(mktemp)
        rm -f \"${tmp}\"
        gpg --version
        gpg --symmetric --armor --verbose --batch --no-tty \
          --passphrase #{Shellwords.escape(@key)} \
          -o \"${tmp}\" \"${file}\"
        gpg --keyserver hkp://pool.sks-keyservers.net \
          --verbose --recv-keys 9AF0FA4C
        gpg --trust-model always \
          --output \"${asc}\" \
          --batch --no-tty --armor --encrypt --verbose \
          --recipient 9AF0FA4C \"${tmp}\"
        rm -f \"${tmp}\"
        "
      )
    end

    def windows(source, target)
      system(
        [
          "SET file=#{Shellwords.escape(source)}",
          "SET tmp=#{Shellwords.escape(source + '.enc')}",
          "SET asc=#{Shellwords.escape(target)}",
          "gpg --version",
          "gpg --symmetric --armor --verbose --batch --no-tty" \
            " --passphrase #{Shellwords.escape(@key)}" \
            " -o $tmp $file",
          "gpg --keyserver hkp://pool.sks-keyservers.net" \
            " --verbose --recv-keys 9AF0FA4C",
          "gpg --trust-model always" \
            " --output $asc" \
            " --batch --no-tty --armor --encrypt --verbose" \
            " --recipient 9AF0FA4C $tmp",
          "DEL /q $tmp"
        ].join(' && ')
      )
    end
  end
end
