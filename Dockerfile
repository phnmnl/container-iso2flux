FROM ubuntu:16.04

LABEL maintainer="PhenoMeNal-H2020 Project (phenomenal-h2020-users@googlegroups.com)"
LABEL software.version="0.6.1"
LABEL version="2.1"
LABEL software="iso2flux"
LABEL description="Uses C13 tracing data for fitting fluxes on metabolic network"
LABEL website="https://github.com/cfoguet/iso2flux"
LABEL documentation="https://github.com/cfoguet/iso2flux"
LABEL license="https://github.com/cfoguet/iso2flux"
LABEL tags="Metabolomics"

ENV ISO2FLUX_REVISION "esc844a3551d5edcea07a98725f1e59f370b324f07"

RUN apt-get -y update && apt-get -y install --no-install-recommends git libglpk-dev \
                      libxml2-dev libxslt1-dev python-dev python-pip pkg-config zlib1g-dev python-tk libssl-dev && \
    pip install --upgrade pip && pip install -U setuptools && \
    pip install urllib3[secure] && pip install -e git+https://github.com/cfoguet/iso2flux.git@$ISO2FLUX_REVISION#egg=iso2flux && \
    apt-get purge -y git python-pip python-dev zlib1g-dev pkg-config libpng-dev libxml2-dev libxslt1-dev zlib1g-dev && \
    apt-get install -y --no-install-recommends python python-dev gcc && \
    apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD runTest1.sh /usr/local/bin/runTest1.sh
RUN chmod a+x /usr/local/bin/runTest1.sh

ENTRYPOINT ["create_and_solve_iso2flux_model.py"]

