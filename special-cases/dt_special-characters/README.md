# The Problem

Connecting to databases with the `pool` and `dplyr` library from different OS can result in differently encoded output, which ultimately leads to incorrectly displayed characters in shiny apps deployed to shinyapps.io. This problem was encountered when building interactives for the Oxford Roman Economy Project, a copy of the problematic table is provided in `data-raw/oxrep_Shipwrecks.sql` for reproducability of the problem.

It's recommended by RStudio that `pool` is used 