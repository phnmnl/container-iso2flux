#!/bin/bash

apt-get update -y && apt-get install -y --no-install-recommends wget ca-certificates

# Testing for version 0.2.x of the container

# Download data
wget "https://drive.google.com/uc?export=download&id=0B2e3YmwhK4fkck1mQVpMQTZZakk" -O constraints.csv
wget "https://drive.google.com/uc?export=download&id=0B3GjpBpPCNBcbXMtQTJqUUg0SzQ" -O output_midcor.csv
wget "https://drive.google.com/uc?export=download&id=0B2e3YmwhK4fkbXdTS2FKMFlWYnc" -O simple_model.sbml
wget "https://drive.google.com/uc?export=download&id=0B2e3YmwhK4fkN21EZF9hSHVTeTQ" -O simple_tracing_model.csv

create_and_solve_iso2flux_model.py -e output_midcor.csv -l simple_tracing_model.csv -s simple_model.sbml -c constraints.csv -i

ls -l Iso*

# check that result file exists.
FLUXES=Iso2Flux_fluxes.csv
LABELS=Iso2Flux_label.csv
CONSTRAINED_MODEL=Iso2Flux_constrained_model.xml
FLUX_INTERVALS=Iso2Flux_flux_interval.csv


for f in $FLUXES $LABELS $CONSTRAINED_MODEL $FLUX_INTERVALS; do
	if [ ! -f $f ]; then
   		echo "File $f does not exist, failing test."
   		exit 1
	fi
done

echo "Iso2flux runs with test data without error codes, all expected files created."
