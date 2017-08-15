#!/bin/bash

# Start the application, assuming we are already in the job directory

oozie job -config job.properties -run
