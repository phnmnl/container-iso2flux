FROM ubuntu:14.04
MAINTAINER cfoguet (temp@temp.com)


RUN apt-get -y update && apt-get -y install git python-dev libglpk-dev python-pip
RUN apt-get install -y libfreetype6-dev libfreetype6 libpng-dev pkg-config libxml2-dev libxslt1-dev zlib1g-dev python-tk
RUN pip install --upgrade pip
RUN pip install -e git+https://github.com/cfoguet/iso2flux.git@master#egg=iso2flux

ENTRYPOINT ["run_iso2flux.py"]
