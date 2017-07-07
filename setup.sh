#!/bin/bash

echo '#!/bin/bash'>./bl
echo 'save_path=$PWD'>>./bl
echo 'cd '$PWD >>./bl
echo './backlight.rb $*'>>./bl
echo 'cd $save_path'>>./bl

echo 'alias blh="bl hight"'>>/etc/bash.bashrc
echo 'alias bll="bl low"'>>/etc/bash.bashrc
echo 'alias blm="bl middle"'>>/etc/bash.bashrc
source /etc/bash.bashrc

sudo cp ./bl /usr/bin/bl
chmod +x /usr/bin/bl

echo 'Setup Finished'
echo 'use bl --help'
