## basic examples:
library(sf)
(pt <- st_point(c(0,1)))
(pol <- st_polygon(list(rbind(c(0,0), c(1,0), c(1,1), c(0,1), c(0,0)))))

st_as_binary(st_point(c(0,1)))
st_as_binary(st_polygon(list(rbind(c(0,0), c(1,0), c(1,1), c(0,1), c(0,0)))))

pol * 2 + pt

### R code from vignette source '/home/edzer/git/sfrj/pebesma.Rnw'

###################################################
### code chunk number 1: pebesma.Rnw:241-244
###################################################
nc = read_sf(system.file("gpkg/nc.gpkg", package="sf"))
plot(nc[,c(9,5)])


###################################################
### code chunk number 2: pebesma.Rnw:247-248 (eval = FALSE)
###################################################
plot(nc[,9], key.pos = 1, axes = TRUE, graticule = TRUE)


###################################################
### code chunk number 3: pebesma.Rnw:260-266 (eval = FALSE)
###################################################
## # devtools::install_github("tidyverse/ggplot2")
library(ggplot2)
library(tidyr)
library(dplyr)
nc2 <- nc %>% st_transform(32119) %>% select(SID74, SID79, geom) %>% gather(VAR, SID, -geom)
ggplot() + geom_sf(data = nc2, aes(fill = SID)) + facet_wrap(~VAR, ncol = 1)


###################################################
### code chunk number 4: pebesma.Rnw:305-308
###################################################
st_area(st_transform(nc[1,], 2264)) # NC state plane, US foot
st_crs(2264)$units
st_area(st_transform(nc[1,], 2264)) %>% units::set_units(km^2) # convert:

