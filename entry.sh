#!/bin/bash
set -x
set -e
set -o pipefail
mkdir -p ~/.ssh
echo -e "Host github.com\n\tStrictHostKeyChecking no\n" > ~/.ssh/config
chmod 600 ~/.ssh/config
git clone "${head}" repo
cd repo
git config user.email "me@rultor.com"
git config user.name "rultor"
if [ "${as_root}" = "true" ]; then
  mkdir /home/r
  cp -R ./* /home/r
  rm -rf repo
  chmod a+x /home/r/script.sh
  /home/r/script.sh
  mv /home/r/repo .
else
  shopt -s dotglob
  useradd -m -G sudo r
  echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
  cp -R /root/* /home/r
  cp -R ./* /home/r
  rm -rf repo
  chown -R r:r /home/r
  chmod a+x /home/r/script.sh
  su --login r --command /home/r/script.sh
  mv /home/r/repo .
  chown -R `whoami` repo
fi
