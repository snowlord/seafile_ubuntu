#!/bin/sh

#need package

sudo apt-get install build-essential
sudo apt-get install libonig-dev libevent-dev libcurl4-openssl-dev libglib2.0-dev uuid-dev intltool libsqlite3-dev libmysqlclient-dev libarchive-dev libtool libjansson-dev valac libfuse-dev re2c flex python-setuptools cmake openssl libssl-dev

sudo apt-get install git python-setuptools python-django libldap2-dev python-imaging sqlite3

basepath=$(cd `dirname $0`; pwd)

#python package

if [ ! -f "/tmp/pytz-2016.1.tar.gz" ];then
	wget https://pypi.python.org/packages/source/p/pytz/pytz-2016.1.tar.gz -P /tmp/
fi


if [ ! -f "/tmp/Django-1.8.18.tar.gz" ];then
	wget https://www.djangoproject.com/m/releases/1.8/Django-1.8.18.tar.gz -P /tmp/
fi


if [ ! -f "/tmp/django-statici18n-1.1.3.tar.gz" ];then
	wget https://pypi.python.org/packages/source/d/django-statici18n/django-statici18n-1.1.3.tar.gz -P /tmp/
fi

if [ ! -f "/tmp/djangorestframework-3.3.2.tar.gz" ];then
	wget https://pypi.python.org/packages/source/d/djangorestframework/djangorestframework-3.3.2.tar.gz -P /tmp/
fi

if [ ! -f "/tmp/django_compressor-1.4.tar.gz" ];then
	wget https://pypi.python.org/packages/source/d/django_compressor/django_compressor-1.4.tar.gz -P /tmp/
fi


if [ ! -f "/tmp/jsonfield-1.0.3.tar.gz" ];then
	wget https://pypi.python.org/packages/source/j/jsonfield/jsonfield-1.0.3.tar.gz -P /tmp/
fi

if [ ! -f "/tmp/django-post_office-2.0.6.tar.gz" ];then
	wget https://pypi.python.org/packages/source/d/django-post_office/django-post_office-2.0.6.tar.gz -P /tmp/
fi

if [ ! -f "/tmp/gunicorn-19.4.5.tar.gz" ];then
	wget http://pypi.python.org/packages/source/g/gunicorn/gunicorn-19.4.5.tar.gz -P /tmp/
fi

if [ ! -f "/tmp/flup-1.0.2.tar.gz" ];then
	wget http://pypi.python.org/packages/source/f/flup/flup-1.0.2.tar.gz -P /tmp/
fi

if [ ! -f "/tmp/chardet-2.3.0.tar.gz" ];then
	wget https://pypi.python.org/packages/source/c/chardet/chardet-2.3.0.tar.gz -P /tmp/
fi

if [ ! -f "/tmp/python-dateutil-1.5.tar.gz" ];then
	wget https://labix.org/download/python-dateutil/python-dateutil-1.5.tar.gz -P /tmp/
fi

if [ ! -f "/tmp/six-1.9.0.tar.gz" ];then
	wget https://pypi.python.org/packages/source/s/six/six-1.9.0.tar.gz -P /tmp/
fi

if [ ! -f "/tmp/django-picklefield-0.3.2.tar.gz" ];then
	wget https://pypi.python.org/packages/source/d/django-picklefield/django-picklefield-0.3.2.tar.gz -P /tmp/
fi

if [ ! -f "/tmp/bde7f7c.zip" ];then
	wget https://github.com/haiwen/django-constance/archive/bde7f7c.zip -P /tmp/
fi

if [ ! -f "/tmp/jdcal-1.2.tar.gz" ];then
	wget https://pypi.python.org/packages/source/j/jdcal/jdcal-1.2.tar.gz -P /tmp/
fi

if [ ! -f "/tmp/et_xmlfile-1.0.1.tar.gz" ];then
	wget https://pypi.python.org/packages/source/e/et_xmlfile/et_xmlfile-1.0.1.tar.gz -P /tmp/
fi

if [ ! -f "/tmp/openpyxl-2.3.0.tar.gz" ];then
	wget https://pypi.python.org/packages/source/o/openpyxl/openpyxl-2.3.0.tar.gz -P /tmp/
fi


mkdir seahub_thirdpart
cd $basepath/seahub_thirdpart


export PYTHONPATH=.

easy_install -d . /tmp/pytz-2016.1.tar.gz
easy_install -d . /tmp/Django-1.8.18.tar.gz
easy_install -d . /tmp/django-statici18n-1.1.3.tar.gz
easy_install -d . /tmp/djangorestframework-3.3.2.tar.gz
easy_install -d . /tmp/django_compressor-1.4.tar.gz
easy_install -d . /tmp/jsonfield-1.0.3.tar.gz
easy_install -d . /tmp/django-post_office-2.0.6.tar.gz
easy_install -d . /tmp/gunicorn-19.4.5.tar.gz
easy_install -d . /tmp/flup-1.0.2.tar.gz
easy_install -d . /tmp/chardet-2.3.0.tar.gz
easy_install -d . /tmp/python-dateutil-1.5.tar.gz
easy_install -d . /tmp/six-1.9.0.tar.gz
easy_install -d . /tmp/django-picklefield-0.3.2.tar.gz
easy_install -d . /tmp/bde7f7c.zip
easy_install -d . /tmp/jdcal-1.2.tar.gz
easy_install -d . /tmp/et_xmlfile-1.0.1.tar.gz
easy_install -d . /tmp/openpyxl-2.3.0.tar.gz

#sudo pip install django

cd $basepath

export PKG_CONFIG_PATH="$basepath/dev/seafile-server/lib":$PKG_CONFIG_PATH
export PKG_CONFIG_PATH="$basepath/dev/libsearpc":$PKG_CONFIG_PATH
export PKG_CONFIG_PATH="$basepath/dev/ccnet-server":$PKG_CONFIG_PATH

mkdir dev

cd dev
git clone https://www.github.com/haiwen/libevhtp.git
cd libevhtp
cmake -DEVHTP_DISABLE_SSL=ON -DEVHTP_BUILD_SHARED=OFF .
make
sudo make install
sudo ldconfig
cd $basepath


cd dev
git clone https://github.com/haiwen/libsearpc.git
cd libsearpc
git reset --hard v3.0-latest
./autogen.sh
./configure
make dist
cd $basepath


cd dev
git clone https://github.com/haiwen/ccnet-server.git
cd ccnet-server
git reset --hard v6.0.1-server
./autogen.sh
./configure
make dist
cd $basepath


cd dev
git clone https://github.com/haiwen/seafile-server.git
cd seafile-server
git reset --hard v6.0.1-server
./autogen.sh
./configure
make dist
cd $basepath

cd dev
git clone https://github.com/haiwen/seahub.git
cd seahub
git reset --hard v6.0.1-server
./tools/gen-tarball.py --version=6.0.1 --branch=HEAD
cd $basepath

cd dev
git clone https://github.com/haiwen/seafobj.git
cd seafobj
git reset --hard v6.0.1-server
make dist
cd $basepath

cd dev
git clone https://github.com/haiwen/seafdav.git
cd seafdav
git reset --hard v6.0.1-server
make
cd $basepath


mkdir seafile-sources

cp dev/libsearpc/libsearpc-1.2.2.tar.gz seafile-sources/
cp dev/ccnet-server/ccnet-6.0.1.tar.gz seafile-sources/
cp dev/seafile-server/seafile-6.0.1.tar.gz seafile-sources/
cp dev/seahub/seahub-6.0.1.tar.gz seafile-sources/



cp dev/seafobj/seafobj.tar.gz seafile-sources/
cp dev/seafdav/seafdav.tar.gz seafile-sources/


mkdir seafile-server-pkgs


$basepath/dev/seafile-server/scripts/build/build-server.py --libsearpc_version=1.2.2 --ccnet_version=6.0.1 --seafile_version=6.0.1 --thirdpartdir="$basepath/seahub_thirdpart" --srcdir="$basepath/seafile-sources" --outputdir="$basepath/seafile-server-pkgs" --version=6.0.1
