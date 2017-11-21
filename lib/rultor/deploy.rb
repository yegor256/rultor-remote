require 'shellwords'
require 'English'
require 'yaml'

module Rultor
  class Deploy
    def self.run
      create_script_sh
      rultor_yml = File.join(Dir.pwd, '.rultor.yml')
      @config = YAML.load_file(rultor_yml)
      execute(
        "
        docker run -it --rm -v `pwd`:/main -w='/main' #{self.env} --name=rultor-remote #{@config["docker"]["image"]} /main/entry.sh
        "
      )
    end

    private

    def self.execute(command)
      puts 'Executing command:'
      puts command
      system(command)
    end

    def self.create_script_sh
      system(
        "
          cat <<EOT > script.sh
          #!/bin/bash
          set -x
          set -e
          set -o pipefail
          shopt -s expand_aliases
          alias 'sudo=sudo -i'
          export HOME=/home/r
          cd \$HOME/repo
          EOT
          echo '${scripts[@]}' >> script.sh
        "
      )
    end

    def self.env
      str = ""
      variables = @config["env"]
      variables.merge!({
        head: (%x[ git remote get-url origin ]).strip,
        head_branch: "master"
      })
      variables.each do |key, value|
        str += "--env=#{key}=#{value} "
      end
      str
    end
  end
end
