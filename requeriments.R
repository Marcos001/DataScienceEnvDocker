install.packages("devtools", repos='http://cran.rstudio.com/')
install.packages("dplyr",  repos = 'https://cloud.r-project.org')
install.packages("fNonlinear", repos='http://cran.rstudio.com/')
install.packages("ppclust",  repos='http://cran.rstudio.com/')
install.packages("EMD", repos='http://cran.rstudio.com/')
install.packages("tseriesChaos", repos='http://cran.rstudio.com/')
install.packages("Metrics", repos='http://cran.rstudio.com/')
install.packages("beepr", repos='http://cran.rstudio.com/')

install.packages("rgl", repos='http://R-Forge.R-project.org') # no instaled
install.packages("TSdist",  repos='http://cran.rstudio.com/') # no instaled

# for jupyter-lab
install.packages(c('repr', 'IRdisplay', 'evaluate', 'crayon', 'pbdZMQ', 'devtools', 'uuid', 'digest'))
devtools::install_github('IRkernel/IRkernel')

# install system-wide
IRkernel::installspec(user = FALSE)