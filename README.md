# Urchin Labs Data Cloud

I often felt limited by my computer's processing power and memory capacity to run large data problems.  However, building a data science environment in the cloud (and installing all the packages I needed) was time consuming and difficult.  I wished there was a way to have access to powerful computational resources with only a single click.  These scripts will spin up an Amazon EC2 instance and transform it into a data science environment that is no different than working within your local Jupyter notebook. 

As a default, the script installs and configures:

- Jupyter Notebook 5.0.x
- Conda Python 3.x environment
- pandas, matplotlib, scipy, seaborn, scikit-learn, scikit-image, sympy, cython, patsy, statsmodel, cloudpickle, dill, numba, bokeh
- Conda R v3.3.x and channel
- plyr, devtools, shiny, rmarkdown, forecast, rsqlite, reshape2, nycflights13, caret, rcurl, and randomforest pre-installed
- The tidyverse R packages are also installed, including ggplot2, dplyr, tidyr, readr, purrr, tibble, stringr, lubridate, and broom

## Installation

See [Install Guide](https://github.com/mikekosk/datascience-cloud/blob/master/INSTALL.md "Install Guide")

## Quick Run

Building your instance and configuring it is done entirely by running:
``` 
terraform apply
```
The function returns a shareable URL to your Jupyter notebook on the cloud!

## User Guide

See [User Guide](https://github.com/mikekosk/datascience-cloud/blob/master/USER-GUIDE.md)

## License

[MIT](https://github.com/electron/electron/blob/master/LICENSE "MIT")

