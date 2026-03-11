#' this scratchwork file will likely become final code for making png images of
#' historic zoning maps and boundary overlays for my website

rm(list = ls())
gc()

set.seed(1234) 
options(scipen = 999)

library(terra)
library(sf)
library(tidyverse)
library(ggplot2)
library(tidyterra)


# ---- load boundaries ----------------------------------------------------
## original zoning boundaries
# load the source file
original_st <- st_read(dsn = "/home/nicholas/repos/historic zoning map/boundaries/_orignals", layer = "original_boundaries")

original_sf <- st_as_sf(original_st)  # convert to simple features

original_sf <- st_zm(original_sf)  # drop the z dimension if present

original_sf <- st_cast(original_sf, "LINESTRING")  # convert to just linestring, not multi-line


## final zoning boundaries
# load the source file
final_st <- st_read(dsn = "/home/nicholas/repos/historic zoning map/boundaries/_final_boundaries/", layer = "final_boundaries")

final_sf <- st_as_sf(final_st)  # convert to simple features

final_sf <- st_zm(final_sf)  # drop the z dimension if present

final_sf <- st_cast(final_sf, "LINESTRING")  # convert to just linestring, not multi-line


# ---- making maps --------------------------------------------------------
### ashland
r <- terra::rast("/home/nicholas/repos/historic zoning map/raster_maps/tif/Ashland_1972/G3764_A78G44_1976_P4.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Ashland")

final <- final_sf %>% filter(BASENAME == "Ashland")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r, maxcell = 30e6) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/raster_maps/png_maps/ashland-1976.png", width=20, height=16, units="in", limitsize = FALSE)


### bedford
r <- terra::rast("/home/nicholas/repos/historic zoning map/raster_maps/tif/Bedford_1979/G3764_B3G44_1979_B4.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Bedford")

final <- final_sf %>% filter(BASENAME == "Bedford")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r, maxcell = 30e6) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/raster_maps/png_maps/bedford-1979.png", width=20, height=16, units="in", limitsize = FALSE)


### beverly
r <- terra::rast("/home/nicholas/repos/historic zoning map/raster_maps/tif/Beverley_1975/G3764_B5G44_1975_B4.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Beverley")

final <- final_sf %>% filter(BASENAME == "Beverly")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r, maxcell = 30e6) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/raster_maps/png_maps/beverly-1975.png", width=20, height=16, units="in", limitsize = FALSE)


### brookline
r <- terra::rast("/home/nicholas/repos/historic zoning map/raster_maps/tif/Brookline_1975/G3764_B9G44_1975_P5.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Brookline")

final <- final_sf %>% filter(BASENAME == "Brookline")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r, maxcell = 30e6) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/raster_maps/png_maps/brookline-1975.png", width=20, height=16, units="in", limitsize = FALSE)


### cambridge
r <- terra::rast("/home/nicholas/repos/historic zoning map/raster_maps/tif/Cambridge_1982/G3764_C2G44_1981_C3.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Cambridge")

final <- final_sf %>% filter(BASENAME == "Cambridge")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r, maxcell = 30e6) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/raster_maps/png_maps/cambridge-1981.png", width=20, height=16, units="in", limitsize = FALSE)

### Cohasset
r <- terra::rast("/home/nicholas/repos/historic zoning map/raster_maps/tif/Cohasset_1976/G3764_C642G44_1976_Y6_RECTO.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Cohasset")

final <- final_sf %>% filter(BASENAME == "Cohasset")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r, maxcell = 30e6) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/raster_maps/png_maps/cohasset-1976.png", width=20, height=16, units="in", limitsize = FALSE)

### Duxbury_1982
r <- terra::rast("/home/nicholas/repos/historic zoning map/raster_maps/tif/Duxbury_1982/G3764_D85G44_1982_D8.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Duxbury")

final <- final_sf %>% filter(BASENAME == "Duxbury")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r, maxcell = 30e6) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/raster_maps/png_maps/duxbury-1982.png", width=20, height=16, units="in", limitsize = FALSE)


### Hanover_1965
r <- terra::rast("/home/nicholas/repos/historic zoning map/raster_maps/tif/Hanover_1965/G3764_H3G44_1965_T4.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Hanover")

final <- final_sf %>% filter(BASENAME == "Hanover")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r, maxcell = 30e6) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/raster_maps/png_maps/hanover-1965.png", width=20, height=16, units="in", limitsize = FALSE)


### Holbrook_1971
r <- terra::rast("/home/nicholas/repos/historic zoning map/raster_maps/tif/Holbrook_1971/G3764_H64G44_1971_H6.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Holbrook")

final <- final_sf %>% filter(BASENAME == "Holbrook")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r, maxcell = 30e6) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/raster_maps/png_maps/holbrook-1971.png", width=20, height=16, units="in", limitsize = FALSE)


### Holliston_1986
r <- terra::rast("/home/nicholas/repos/historic zoning map/raster_maps/tif/Holliston_1986/G3764_H68G44_1986_H6.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Holliston")

final <- final_sf %>% filter(BASENAME == "Holliston")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r, maxcell = 30e6) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/raster_maps/png_maps/holliston-1986.png", width=20, height=16, units="in", limitsize = FALSE)


### Hudson_1981
r <- terra::rast("/home/nicholas/repos/historic zoning map/raster_maps/tif/Hudson_1981/G3764_H82G44_1981_T4.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Hudson")

final <- final_sf %>% filter(BASENAME == "Hudson")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r, maxcell = 30e6) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/raster_maps/png_maps/hudson-1981.png", width=20, height=16, units="in", limitsize = FALSE)


### Lincoln_1983
r <- terra::rast("/home/nicholas/repos/historic zoning map/raster_maps/tif/Lincoln_1983/G3764_L63G44_1983_C4.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Lincoln")

final <- final_sf %>% filter(BASENAME == "Lincoln")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r, maxcell = 30e6) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/raster_maps/png_maps/lincoln-1983.png", width=20, height=16, units="in", limitsize = FALSE)

stop()
### Malden_1979
r <- terra::rast("/home/nicholas/repos/historic zoning map/raster_maps/tif/Malden_1979/G3764_M2G44_1979_M3.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Malden")

final <- final_sf %>% filter(BASENAME == "Malden")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r, maxcell = 30e6) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/raster_maps/png_maps/malden-1979.png", width=20, height=16, units="in", limitsize = FALSE)


### Marshfield_1982
r <- terra::rast("/home/nicholas/repos/historic zoning map/raster_maps/tif/Marshfield_1982/G3764_M362G44_1982_M4.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Marshfield")

final <- final_sf %>% filter(BASENAME == "Marshfield")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r, maxcell = 30e6) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/raster_maps/png_maps/marshfield-1982.png", width=20, height=16, units="in", limitsize = FALSE)


### Maynard_1986
r <- terra::rast("/home/nicholas/repos/historic zoning map/raster_maps/tif/Maynard_1986/G3764_M47G44_1986_S5.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Maynard")

final <- final_sf %>% filter(BASENAME == "Maynard")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r, maxcell = 30e6) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/raster_maps/png_maps/maynard-1986.png", width=20, height=16, units="in", limitsize = FALSE)


### Medway_1974
r <- terra::rast("/home/nicholas/repos/historic zoning map/raster_maps/tif/Medway_1974/G3764_M57G44_1974_M4.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Medway")

final <- final_sf %>% filter(BASENAME == "Medway")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r, maxcell = 30e6) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/raster_maps/png_maps/medway-1974.png", width=20, height=16, units="in", limitsize = FALSE)


### Milford_1976
r <- terra::rast("/home/nicholas/repos/historic zoning map/raster_maps/tif/Milford_1976/G3764_M76G44_1976_M5.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Milford")

final <- final_sf %>% filter(BASENAME == "Milford")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r, maxcell = 30e6) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/raster_maps/png_maps/milford-1976.png", width=20, height=16, units="in", limitsize = FALSE)


### Millis_1980
r <- terra::rast("/home/nicholas/repos/historic zoning map/raster_maps/tif/Millis_1980/G3764_M8G44_1980_M5.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Millis")

final <- final_sf %>% filter(BASENAME == "Millis")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r, maxcell = 30e6) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/raster_maps/png_maps/millis-1980.png", width=20, height=16, units="in", limitsize = FALSE)


### Milton_1938
r <- terra::rast("/home/nicholas/repos/historic zoning map/raster_maps/tif/Milton_1938/G3764_M84G44_1986_M3.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Milton")

final <- final_sf %>% filter(BASENAME == "Milton")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r, maxcell = 30e6) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/raster_maps/png_maps/milton-1938.png", width=20, height=16, units="in", limitsize = FALSE)


### Needham_1979
r <- terra::rast("/home/nicholas/repos/historic zoning map/raster_maps/tif/Needham_1979/G3764_N3G44_1979_N4.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Needham")

final <- final_sf %>% filter(BASENAME == "Needham")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r, maxcell = 30e6) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/raster_maps/png_maps/needham-1979.png", width=20, height=16, units="in", limitsize = FALSE)


### Norfolk_1973
r <- terra::rast("/home/nicholas/repos/historic zoning map/raster_maps/tif/Norfolk_1973/G3764_N6G44_1973_N6.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Norfolk")

final <- final_sf %>% filter(BASENAME == "Norfolk")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r, maxcell = 30e6) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/raster_maps/png_maps/norfolk-1973.png", width=20, height=16, units="in", limitsize = FALSE)


### Norwell_1981
r <- terra::rast("/home/nicholas/repos/historic zoning map/raster_maps/tif/Norwell_1981/G3764_N88G44_1981_J3.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Norwell")

final <- final_sf %>% filter(BASENAME == "Norwell")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r, maxcell = 30e6) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/raster_maps/png_maps/norwell-1981.png", width=20, height=16, units="in", limitsize = FALSE)


### Pembroke 1972
r <- terra::rast("/home/nicholas/repos/historic zoning map/raster_maps/tif/Pembroke 1972/G3764_P36G44_1975_P4.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Pembroke")

final <- final_sf %>% filter(BASENAME == "Pembroke")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r, maxcell = 30e6) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/raster_maps/png_maps/pembroke-1972.png", width=20, height=16, units="in", limitsize = FALSE)


### Randolph_1976
r <- terra::rast("/home/nicholas/repos/historic zoning map/raster_maps/tif/Randolph_1976/G3764_R2G44_1976_O2.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Randolph")

final <- final_sf %>% filter(BASENAME == "Randolph")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r, maxcell = 30e6) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/raster_maps/png_maps/randolph-1976.png", width=20, height=16, units="in", limitsize = FALSE)


### Revere_1983
r <- terra::rast("/home/nicholas/repos/historic zoning map/raster_maps/tif/Revere_1983/Revere_1983_C3.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Revere")

final <- final_sf %>% filter(BASENAME == "Revere")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r, maxcell = 30e6) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/raster_maps/png_maps/revere-1983.png", width=20, height=16, units="in", limitsize = FALSE)


### Saugus_1978
r <- terra::rast("/home/nicholas/repos/historic zoning map/raster_maps/tif/Saugus_1978/G3764_S3G44_1978_O8.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Saugus")

final <- final_sf %>% filter(BASENAME == "Saugus")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r, maxcell = 30e6) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/raster_maps/png_maps/saugus-1978.png", width=20, height=16, units="in", limitsize = FALSE)


### Scituate_1971
r <- terra::rast("/home/nicholas/repos/historic zoning map/raster_maps/tif/Scituate_1971/G3764_S322G44_1971_G3.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Scituate")

final <- final_sf %>% filter(BASENAME == "Scituate")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r, maxcell = 30e6) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/raster_maps/png_maps/scituate-1971.png", width=20, height=16, units="in", limitsize = FALSE)


### Somerville_1984
r <- terra::rast("/home/nicholas/repos/historic zoning map/raster_maps/tif/Somerville_1984/G3764_S4G44_1984_S6.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Somerville")

final <- final_sf %>% filter(BASENAME == "Somerville")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r, maxcell = 30e6) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/raster_maps/png_maps/somerville-1984.png", width=20, height=16, units="in", limitsize = FALSE)


### Southboro_1984
r <- terra::rast("/home/nicholas/repos/historic zoning map/raster_maps/tif/Southboro_1984/G3764_S582G44_1984_M3.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Southboro")

final <- final_sf %>% filter(BASENAME == "Southboro")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r, maxcell = 30e6) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/raster_maps/png_maps/southboro-1984.png", width=20, height=16, units="in", limitsize = FALSE)


### Stoneham_1983
r <- terra::rast("/home/nicholas/repos/historic zoning map/raster_maps/tif/Stoneham_1983/G3764_S77G44_1983_M3.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Stoneham")

final <- final_sf %>% filter(BASENAME == "Stoneham")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r, maxcell = 30e6) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/raster_maps/png_maps/stoneham-1983.png", width=20, height=16, units="in", limitsize = FALSE)


### Stow_1978
r <- terra::rast("/home/nicholas/repos/historic zoning map/raster_maps/tif/Stow_1978/G3764_S822G44_1978_S8.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Stow")

final <- final_sf %>% filter(BASENAME == "Stow")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r, maxcell = 30e6) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/raster_maps/png_maps/stow-1978.png", width=20, height=16, units="in", limitsize = FALSE)


### Wakefield_1984
r <- terra::rast("/home/nicholas/repos/historic zoning map/raster_maps/tif/Wakefield_1984/G3764_W14G44_1984_C6.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Wakefield")

final <- final_sf %>% filter(BASENAME == "Wakefield")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r, maxcell = 30e6) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/raster_maps/png_maps/wakefield-1984.png", width=20, height=16, units="in", limitsize = FALSE)


### Waltham_1960
r <- terra::rast("/home/nicholas/repos/historic zoning map/raster_maps/tif/Waltham_1960/G3764_W2G44_1960_W3.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Waltham")

final <- final_sf %>% filter(BASENAME == "Waltham")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r, maxcell = 30e6) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/raster_maps/png_maps/waltham-1960.png", width=20, height=16, units="in", limitsize = FALSE)


### Wellesley_1975
r <- terra::rast("/home/nicholas/repos/historic zoning map/raster_maps/tif/Wellesley_1975/G3764_W38G44_1975_W4.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Wellesley")

final <- final_sf %>% filter(BASENAME == "Wellesley")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r, maxcell = 30e6) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/raster_maps/png_maps/wellesley-1975.png", width=20, height=16, units="in", limitsize = FALSE)


### Weston_1970
r <- terra::rast("/home/nicholas/repos/historic zoning map/raster_maps/tif/Weston_1970/G3764_W66G44_1970_W4.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Weston")

final <- final_sf %>% filter(BASENAME == "Weston")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r, maxcell = 30e6) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/raster_maps/png_maps/weston-1970.png", width=20, height=16, units="in", limitsize = FALSE)


### Weymouth_1985
r <- terra::rast("/home/nicholas/repos/historic zoning map/raster_maps/tif/Weymouth_1985/G3764_W7G44_1985_W4.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Weymouth")

final <- final_sf %>% filter(BASENAME == "Weymouth")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r, maxcell = 30e6) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/raster_maps/png_maps/weymouth-1985.png", width=20, height=16, units="in", limitsize = FALSE)


### Wrentham_1973
r <- terra::rast("/home/nicholas/repos/historic zoning map/raster_maps/tif/Wrentham_1973/G3764_W96G44_1973_E2.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Wrentham")

final <- final_sf %>% filter(BASENAME == "Wrentham")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r, maxcell = 30e6) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/raster_maps/png_maps/wrentham-1973.png", width=20, height=16, units="in", limitsize = FALSE)


### NAME
r <- terra::rast("/home/nicholas/repos/historic zoning map/raster_maps/tif/NAME")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Cambridge")

final <- final_sf %>% filter(BASENAME == "Cambridge")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r, maxcell = 30e6) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/raster_maps/png_maps/NAME-YEAR.png", width=20, height=16, units="in", limitsize = FALSE)


### NAME
r <- terra::rast("/home/nicholas/repos/historic zoning map/raster_maps/tif/NAME")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Cambridge")

final <- final_sf %>% filter(BASENAME == "Cambridge")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r, maxcell = 30e6) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/raster_maps/png_maps/NAME-YEAR.png", width=20, height=16, units="in", limitsize = FALSE)


### NAME
r <- terra::rast("/home/nicholas/repos/historic zoning map/raster_maps/tif/NAME")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Cambridge")

final <- final_sf %>% filter(BASENAME == "Cambridge")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r, maxcell = 30e6) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/raster_maps/png_maps/NAME-YEAR.png", width=20, height=16, units="in", limitsize = FALSE)


### NAME
r <- terra::rast("/home/nicholas/repos/historic zoning map/raster_maps/tif/NAME")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Cambridge")

final <- final_sf %>% filter(BASENAME == "Cambridge")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r, maxcell = 30e6) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/raster_maps/png_maps/NAME-YEAR.png", width=20, height=16, units="in", limitsize = FALSE)
