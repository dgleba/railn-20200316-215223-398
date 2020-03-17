#!/bin/bash

# This script runs the app through code metrics.
# Violations will not stop the app from passing but will be flagged here.

# bin/daudit, bin/dbrakeman, bin/dgemsurance, bin/drbp, and bin/dsandi

bin/dbundle
bin/dbrakeman
bin/dsandi
bin/daudit
bin/dcop
bin/drbp
bin/dgemsurance
