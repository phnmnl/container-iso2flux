#!/bin/bash

apt-get update -y && apt-get install -y --no-install-recommends wget ca-certificates

# Testing for version 0.2.x of the container

# Download data
wget "https://drive.google.com/uc?export=download&id=0B2e3YmwhK4fkck1mQVpMQTZZakk" -O constraints.csv
wget "https://drive.google.com/uc?export=download&id=0B3GjpBpPCNBcbXMtQTJqUUg0SzQ" -O output_midcor.csv
wget "https://drive.google.com/uc?export=download&id=0B2e3YmwhK4fkbXdTS2FKMFlWYnc" -O simple_model.sbml
wget "https://drive.google.com/uc?export=download&id=0B2e3YmwhK4fkN21EZF9hSHVTeTQ" -O simple_tracing_model.csv

create_and_solve_iso2flux_model.py -e output_midcor.csv -l simple_tracing_model.csv -s simple_model.sbml -c constraints.csv -q

# check that result file exists.
BEST_FLUXES=best_fluxes.csv
BEST_LABEL=best_label.csv
CONSTRAINED_MODEL=constrained_model.xml


for f in $BEST_FLUXES $BEST_LABEL $CONSTRAINED_MODEL; do
	if [ ! -f $f ]; then
   		echo "File $f does not exist, failing test."
   		exit 1
	fi
done

echo "Iso2flux runs with test data without error codes, all expected files created."
