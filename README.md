# Iso2Flux
Version: 0.7.1

## Short Description

Open source software for steady state 13C flux analysis

## Description

Iso2Flux is a Python-based flux analysis software that allows  13C Metabolic Flux Analysis to be performed on a sub-network of a large scale metabolic model. 

Iso2flux uses constraint-based modelling to compute steady state fluxes across a large metabolic network and uses these flxues to predict 13C distribution across a subset of the newtork. Then, given a set of 13C data, Iso2flux can iteratively find the steady state flux distributions that are most consistent with the computed fluxes. 

## Key features

- Constraint-Based Modelling
- 13C Metabolic Flux Analysis

## Functionality

- Post-processing
- Statistical Analysis
- Workflows 

## Approaches

- Isotopic Labelling Analysis / 13C

## Instrument Data Types

- MS

## Screenshots


## Tool Authors

- Carles Foguet (University of Barcelona)
- Pedro de Atauri (University of Barcelona)
- Vitaly Selinvanov (University of Barcelona)
- Marta Cascante (Univesity of Barcelona)

## Container Contributors

- [Pablo Moreno](https://github.com/pcm32) 
- [Carles Foguet](https://github.com/cfoguet) 


## Website

- https://github.com/cfoguet/iso2flux


## Git Repository

- https://github.com/cfoguet/iso2flux

## Installation

Iso2flux is present on all PhenoMeNal Galaxy instances on deployed Cloud Research Environments, under the Fluxomics category in the tool bar to the left of the screen. No installation is needed on PhenoMeNal Cloud Research Environments.

For advanced Docker usage:

- Go to the directory where the dockerfile is.
- Create container from dockerfile:

```
docker build -t iso2flux .
```

Alternatively, pull from repo:

```
docker pull container-registry.phenomenal-h2020.eu/phnmnl/iso2flux
```


## Usage Instructions
 
On a PhenoMeNal Cloud Research Environment Galaxy instance: 
- Go to the Fluxomics tool category
- Click on iso2flux
- Fill the expected input according to the detail above
- Press Run. 

Additionally, the tool can be used as part of a workflow with the Midcor, Ramid and Escher-Fluxomics tools. Deployed PhenoMeNal  CREs also include a Fluxiomics Stationary Galaxy workflow, which includes Iso2flux. 

Advanced usage through docker

```
docker run -it -v $PWD:/data container-registry.phenomenal-h2020.eu/phnmnl/iso2flux -e /data/tracing_data.csv -l /data/tracing_model.csv -s /data/sbml_model.xml -p parameters.csv -c constraints.csv -q 
```


## Publications
- Carles Foguet, Pedro de Atauri, Vitaly A. Selivanov, Marta Cascante. Iso2Flux: A new software for 13C fluxomics developed in the framework of PhenoMeNal
