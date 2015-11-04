#!/bin/bash

# Get data
status="$(acpi | awk '{print $3 " " $4}')"

# Show data
notify "$status"
