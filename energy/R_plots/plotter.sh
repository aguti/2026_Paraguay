#!/bin/sh

# FORECAST
R < graph_PV_forecast.R --no-save ideal_forecast hirlam_forecast

# EXAMPLE CONSUMPTION
R < graph_experiments_noBat.R --no-save meter_resume_day_noADSM_noBat

# Spanish Aggergated Consumption 2013
R < graph_mufco_grid.R --no-save mufco_grid_nosc
# Aggregated consumption - Weekly optimization
#R < graph_mufco_grid.R --no-save mufco_grid_week


