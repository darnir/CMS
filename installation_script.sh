#!/bin/bash
DIR=$(pwd)
get_cpanm(){
    if [ \! -f /usr/local/bin/cpanm ]; then
		cd $TMP_DIR && curl --insecure -L http://cpanmin.us | perl - App::cpanminus
		if [ \! -f /usr/local/bin/cpanm ]; then
		echo "Downloading from cpanmin.us failed, downloading from xrl.us"
		curl -LO http://xrl.us/cpanm &&
		chmod +x cpanm &&
		mv cpanm /usr/local/bin/cpanm
		fi
	fi
	CPANM=$(which cpanm);
	if [ \! -f "$CPANM" ]; then
		echo "ERROR: Unable to find cpanm"
		return 1;
	fi
	return 0
}
get_cpanm
sudo cpanm LWP::Simple URI::Escape File::HomeDir WWW::Mechanize
cd $DIR
chmod +x script.pl
sudo cp -p script.pl /usr/local/bin/CourseSync
sudo install -g 0 -o 0 -m 0644 .CourseSync.1 /usr/local/share/man/man1/CourseSync.1
