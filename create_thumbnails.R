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
r <- terra::rast("/home/nicholas/repos/historic zoning map/maps/tif/Ashland_1972/G3764_A78G44_1976_P4.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Ashland")

final <- final_sf %>% filter(BASENAME == "Ashland")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/maps/thumbnails/ashland-1976-tn.jpg")


### bedford
r <- terra::rast("/home/nicholas/repos/historic zoning map/maps/tif/Bedford_1979/G3764_B3G44_1979_B4.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Bedford")

final <- final_sf %>% filter(BASENAME == "Bedford")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/maps/thumbnails/bedford-1979-tn.jpg")


### beverly
r <- terra::rast("/home/nicholas/repos/historic zoning map/maps/tif/Beverley_1975/G3764_B5G44_1975_B4.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Beverley")

final <- final_sf %>% filter(BASENAME == "Beverly")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/maps/thumbnails/beverly-1975-tn.jpg")


### brookline
r <- terra::rast("/home/nicholas/repos/historic zoning map/maps/tif/Brookline_1975/G3764_B9G44_1975_P5.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Brookline")

final <- final_sf %>% filter(BASENAME == "Brookline")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/maps/thumbnails/brookline-1975-tn.jpg")


### cambridge
r <- terra::rast("/home/nicholas/repos/historic zoning map/maps/tif/Cambridge_1982/G3764_C2G44_1981_C3.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Cambridge")

final <- final_sf %>% filter(BASENAME == "Cambridge")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/maps/thumbnails/cambridge-1981-tn.jpg")

### Cohasset
r <- terra::rast("/home/nicholas/repos/historic zoning map/maps/tif/Cohasset_1976/G3764_C642G44_1976_Y6_RECTO.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Cohasset")

final <- final_sf %>% filter(BASENAME == "Cohasset")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/maps/thumbnails/cohasset-1976-tn.jpg")

### Duxbury_1982
r <- terra::rast("/home/nicholas/repos/historic zoning map/maps/tif/Duxbury_1982/G3764_D85G44_1982_D8.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Duxbury")

final <- final_sf %>% filter(BASENAME == "Duxbury")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/maps/thumbnails/duxbury-1982-tn.jpg")


### Hanover_1965
r <- terra::rast("/home/nicholas/repos/historic zoning map/maps/tif/Hanover_1965/G3764_H3G44_1965_T4.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Hanover")

final <- final_sf %>% filter(BASENAME == "Hanover")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/maps/thumbnails/hanover-1965-tn.jpg")


### Holbrook_1971
r <- terra::rast("/home/nicholas/repos/historic zoning map/maps/tif/Holbrook_1971/G3764_H64G44_1971_H6.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Holbrook")

final <- final_sf %>% filter(BASENAME == "Holbrook")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/maps/thumbnails/holbrook-1971-tn.jpg")


### Holliston_1986
r <- terra::rast("/home/nicholas/repos/historic zoning map/maps/tif/Holliston_1986/G3764_H68G44_1986_H6.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Holliston")

final <- final_sf %>% filter(BASENAME == "Holliston")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/maps/thumbnails/holliston-1986-tn.jpg")


### Hudson_1981
r <- terra::rast("/home/nicholas/repos/historic zoning map/maps/tif/Hudson_1981/G3764_H82G44_1981_T4.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Hudson")

final <- final_sf %>% filter(BASENAME == "Hudson")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/maps/thumbnails/hudson-1981-tn.jpg")


### Lincoln_1983
r <- terra::rast("/home/nicholas/repos/historic zoning map/maps/tif/Lincoln_1983/G3764_L63G44_1983_C4.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Lincoln")

final <- final_sf %>% filter(BASENAME == "Lincoln")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/maps/thumbnails/lincoln-1983-tn.jpg")


### Malden_1979
r <- terra::rast("/home/nicholas/repos/historic zoning map/maps/tif/Malden_1979/G3764_M2G44_1979_M3.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Malden")

final <- final_sf %>% filter(BASENAME == "Malden")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/maps/thumbnails/malden-1979-tn.jpg")


### Marshfield_1982
r <- terra::rast("/home/nicholas/repos/historic zoning map/maps/tif/Marshfield_1982/G3764_M362G44_1982_M4.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Marshfield")

final <- final_sf %>% filter(BASENAME == "Marshfield")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/maps/thumbnails/marshfield-1982-tn.jpg")


### Maynard_1986
r <- terra::rast("/home/nicholas/repos/historic zoning map/maps/tif/Maynard_1986/G3764_M47G44_1986_S5.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Maynard")

final <- final_sf %>% filter(BASENAME == "Maynard")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/maps/thumbnails/maynard-1986-tn.jpg")


### Medway_1974
r <- terra::rast("/home/nicholas/repos/historic zoning map/maps/tif/Medway_1974/G3764_M57G44_1974_M4.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Medway")

final <- final_sf %>% filter(BASENAME == "Medway")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/maps/thumbnails/medway-1974-tn.jpg")


### Milford_1976
r <- terra::rast("/home/nicholas/repos/historic zoning map/maps/tif/Milford_1976/G3764_M76G44_1976_M5.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Milford")

final <- final_sf %>% filter(BASENAME == "Milford")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/maps/thumbnails/milford-1976-tn.jpg")


### Millis_1980
r <- terra::rast("/home/nicholas/repos/historic zoning map/maps/tif/Millis_1980/G3764_M8G44_1980_M5.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Millis")

final <- final_sf %>% filter(BASENAME == "Millis")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/maps/thumbnails/millis-1980-tn.jpg")


### Milton_1938
r <- terra::rast("/home/nicholas/repos/historic zoning map/maps/tif/Milton_1938/G3764_M84G44_1986_M3.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Milton")

final <- final_sf %>% filter(BASENAME == "Milton")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/maps/thumbnails/milton-1938-tn.jpg")


### Needham_1979
r <- terra::rast("/home/nicholas/repos/historic zoning map/maps/tif/Needham_1979/G3764_N3G44_1979_N4.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Needham")

final <- final_sf %>% filter(BASENAME == "Needham")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/maps/thumbnails/needham-1979-tn.jpg")


### Norfolk_1973
r <- terra::rast("/home/nicholas/repos/historic zoning map/maps/tif/Norfolk_1973/G3764_N6G44_1973_N6.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Norfolk")

final <- final_sf %>% filter(BASENAME == "Norfolk")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/maps/thumbnails/norfolk-1973-tn.jpg")


### Norwell_1981
r <- terra::rast("/home/nicholas/repos/historic zoning map/maps/tif/Norwell_1981/G3764_N88G44_1981_J3.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Norwell")

final <- final_sf %>% filter(BASENAME == "Norwell")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/maps/thumbnails/norwell-1981-tn.jpg")


### Pembroke 1972
r <- terra::rast("/home/nicholas/repos/historic zoning map/maps/tif/Pembroke 1972/G3764_P36G44_1975_P4.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Pembroke")

final <- final_sf %>% filter(BASENAME == "Pembroke")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/maps/thumbnails/pembroke-1972-tn.jpg")


### Randolph_1976
r <- terra::rast("/home/nicholas/repos/historic zoning map/maps/tif/Randolph_1976/G3764_R2G44_1976_O2.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Randolph Town")

final <- final_sf %>% filter(BASENAME == "Randolph Town")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/maps/thumbnails/randolph-1976-tn.jpg")


### Revere_1983
r <- terra::rast("/home/nicholas/repos/historic zoning map/maps/tif/Revere_1983/Revere_1983_C3.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Revere")

final <- final_sf %>% filter(BASENAME == "Revere")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/maps/thumbnails/revere-1983-tn.jpg")


### Saugus_1978
r <- terra::rast("/home/nicholas/repos/historic zoning map/maps/tif/Saugus_1978/G3764_S3G44_1978_O8.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Saugus")

final <- final_sf %>% filter(BASENAME == "Saugus")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/maps/thumbnails/saugus-1978-tn.jpg")


### Scituate_1971
r <- terra::rast("/home/nicholas/repos/historic zoning map/maps/tif/Scituate_1971/G3764_S322G44_1971_G3.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Scituate")

final <- final_sf %>% filter(BASENAME == "Scituate")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/maps/thumbnails/scituate-1971-tn.jpg")


### Somerville_1984
r <- terra::rast("/home/nicholas/repos/historic zoning map/maps/tif/Somerville_1984/G3764_S4G44_1984_S6.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Somerville")

final <- final_sf %>% filter(BASENAME == "Somerville")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/maps/thumbnails/somerville-1984-tn.jpg")


### Southboro_1984
r <- terra::rast("/home/nicholas/repos/historic zoning map/maps/tif/Southboro_1984/G3764_S582G44_1984_M3.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Southborough")

final <- final_sf %>% filter(BASENAME == "Southborough")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/maps/thumbnails/southborough-1984-tn.jpg")


### Stoneham_1983
r <- terra::rast("/home/nicholas/repos/historic zoning map/maps/tif/Stoneham_1983/G3764_S77G44_1983_M3.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Stoneham")

final <- final_sf %>% filter(BASENAME == "Stoneham")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/maps/thumbnails/stoneham-1983-tn.jpg")


### Stow_1978
r <- terra::rast("/home/nicholas/repos/historic zoning map/maps/tif/Stow_1978/G3764_S822G44_1978_S8.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Stow")

final <- final_sf %>% filter(BASENAME == "Stow")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/maps/thumbnails/stow-1978-tn.jpg")


### Wakefield_1984
r <- terra::rast("/home/nicholas/repos/historic zoning map/maps/tif/Wakefield_1984/G3764_W14G44_1984_C6.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Wakefield")

final <- final_sf %>% filter(BASENAME == "Wakefield")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/maps/thumbnails/wakefield-1984-tn.jpg")


### Waltham_1960
r <- terra::rast("/home/nicholas/repos/historic zoning map/maps/tif/Waltham_1960/G3764_W2G44_1960_W3.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Waltham")

final <- final_sf %>% filter(BASENAME == "Waltham")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/maps/thumbnails/waltham-1960-tn.jpg")


### Wellesley_1975
r <- terra::rast("/home/nicholas/repos/historic zoning map/maps/tif/Wellesley_1975/G3764_W38G44_1975_W4.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Wellesley")

final <- final_sf %>% filter(BASENAME == "Wellesley")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/maps/thumbnails/wellesley-1975-tn.jpg")


### Weston_1970
r <- terra::rast("/home/nicholas/repos/historic zoning map/maps/tif/Weston_1970/G3764_W66G44_1970_W4.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Weston")

final <- final_sf %>% filter(BASENAME == "Weston")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/maps/thumbnails/weston-1970-tn.jpg")


### Weymouth_1985
r <- terra::rast("/home/nicholas/repos/historic zoning map/maps/tif/Weymouth_1985/G3764_W7G44_1985_W4.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Weymouth Town")

final <- final_sf %>% filter(BASENAME == "Weymouth Town")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/maps/thumbnails/weymouth-1985-tn.jpg")


### Wrentham_1973
r <- terra::rast("/home/nicholas/repos/historic zoning map/maps/tif/Wrentham_1973/G3764_W96G44_1973_E2.tif")

terra::NAflag(r) <- 0

base <- original_sf %>% filter(BASENAME == "Wrentham")

final <- final_sf %>% filter(BASENAME == "Wrentham")

base <- st_transform(base, crs(r))

final <- st_transform(final, crs(r))

g <- ggplot() + 
  
  geom_spatraster_rgb(data = r) +
  
  geom_spatvector(data = base, color="#FC8D62") + 
  
  geom_spatvector(data = final, color="#66C2A5") + 
  
  theme_void()

ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/maps/thumbnails/wrentham-1973-tn.jpg")


# ### NAME
# r <- terra::rast("/home/nicholas/repos/historic zoning map/maps/tif/NAME")
# 
# terra::NAflag(r) <- 0
# 
# base <- original_sf %>% filter(BASENAME == "Cambridge")
# 
# final <- final_sf %>% filter(BASENAME == "Cambridge")
# 
# base <- st_transform(base, crs(r))
# 
# final <- st_transform(final, crs(r))
# 
# g <- ggplot() + 
#   
#   geom_spatraster_rgb(data = r) +
#   
#   geom_spatvector(data = base, color="#FC8D62") + 
#   
#   geom_spatvector(data = final, color="#66C2A5") + 
#   
#   theme_void()
# 
# ggsave(plot = g, filename = "/home/nicholas/repos/historic zoning map/maps/thumbnails/NAME-YEAR-tn.jpg")


