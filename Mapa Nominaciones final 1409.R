# Remove all the objects we created so far
rm(list = ls()) 

setwd("/Users/davseg/Google Drive/Wave 0/5 - Presentations/Proposal David/Backup/Graphs/datosabiertos.gob/cp_mex ZIP")
# setwd("/Users/davseg/Google Drive/Wave 0/5 - Presentations/Proposal David/Backup/Graphs/datosabiertos.gob/códigos_postales ZIP/códigos_postales/shapes_cps")

# install.packages("shiny") 
# install.packages("urltools")
# install.packages("tmap")
# install.packages("tmaptools")
# install.packages("leaflet")
# install.packages("leaflet.extras")
# install.packages("rio")
# install.packages("scales")
# install.packages("htmlwidgets")
# install.packages("sf")
# install.packages("dplyr")
# install.packages("mapview")
# install.packages("plotly")

# mexdatafile = mexnomfile, mexdatafilecsv = mexnomfilecsv, mexfipscode = mexzipcode
# mexshapefile = nomshapefile, mexdata = nomdata, mexgeo = nomgeo, mgeo = ngeo, mexdata$CP = nomdata$CP
# mgeo$d_cp = ngeo$d_cp, mexmap = nommap, mexstaticmap = nomstaticmap
# StudentsPalette = NomPalette, mxpopup = nompopup, tag.mexmap = tag.nommap
# title = titlenom, mexmap_projected = nommap_projected, 
# Mapa Nominaciones final 1409

# Set various values needed, including names of files and FIPS codes for New Hampshire and South Carolina
mexnomfile <- "Mapa Nominaciones final 1409.xlsx"
mexnomfilecsv <- "Mapa Nominaciones final 1409.csv"
nomshapefile <- "CP_15Mex_v5.shp"
# mexshapefile <- "CP_15EdoMex_v2.shp"
mexzipcode <- c("52900", "52909", "52910", "52915", "52916", "52918", "52919", "52920", "52923", "52924", "52925", "52926", "52927", "52928", "52929", "52930", "52934", "52936", "52937", "52938", "52939", "52940", "52945", "52946", "52947", "52948", "52949", "52950", "52953", "52956", "52957", "52958", "52959", "52960", "52965", "52966", "52967", "52968", "52970", "52975", "52976", "52978", "52978", "52979", "52980", "52985", "52986", "52987", "52988", "52989", "52990", "52994", "52995", "52996", "52997", "52998", "53000", "53010", "53030", "53040", "53050", "53060", "53070", "53100", "53110", "53115", "53116", "53117", "53119", "53120", "53124", "53125", "53126", "53127", "53128", "53129", "53130", "53138", "53140", "53150", "53160", "53170", "53177", "53178", "53179", "53200", "53215", "53216", "53217", "53218", "53219", "53220", "53224", "53227", "53228", "53229", "53230", "53237", "53239", "53240", "53247", "53248", "53250", "53260", "53270", "53278", "53279", "53280", "53283", "53290", "53296", "53297", "53298", "53300", "53309", "53310", "53320", "53329", "53330", "53338", "53339", "53340", "53348", "53350", "53370", "53378", "53390", "53398", "53400", "53410", "53420", "53425", "53426", "53427", "53428", "53430", "53440", "53450", "53458", "53459", "53460", "53470", "53489", "53490", "53500", "53519", "53520", "53529", "53530", "53533", "53550", "53560", "53569", "53570", "53580", "53598", "53640", "53650", "53653", "53654", "53655", "53658", "53659", "53660", "53664", "53670", "53680", "53687", "53688", "53689", "53690", "53694", "53695", "53696", "53697", "53698", "53700", "53708", "53710", "53713", "53714", "53716", "53717", "53718", "53719", "53730", "53760", "53770", "53780", "53787", "53788", "53790", "53798", "53799", "53800", "53809", "53810", "53819", "53820", "53830", "53839", "53840", "53900", "53909", "53910", "53930", "53940", "53950", "53960", "53970", "54400", "54402", "54405", "54407", "54408", "54409", "54410", "54413", "54414", "54416", "54417", "54420", "54424", "54425", "54426", "54430", "54434", "54435", "54439", "54440", "54448", "54449", "54455", "54457", "54459", "54460", "54463", "54464", "54466", "54467", "54469", "54470", "54473", "54474", "54475", "54476", "54477", "54539", "54600", "54602", "54603", "54604", "54605", "54607", "54608", "54610", "54614", "54616", "54640", "54645", "54650", "54655", "54656", "54657", "54658", "54700", "54710", "54712", "54713", "54714", "54715", "54716", "54719", "54720", "54725", "54729", "54730", "54740", "54743", "54744", "54745", "54750", "54753", "54759", "54760", "54763", "54764", "54765", "54766", "54767", "54769")
# mexfipscode <- c("52900", "52909", "52910", "52915", "52916", "52918", "52919", "52920", "52923", "52924", "52925", "52926", "52927", "52928", "52929", "52930", "52934", "52936", "52937", "52938", "52939", "52940", "52945", "52946", "52947", "52948", "52949", "52950", "52953", "52956", "52957", "52958", "52959", "52960", "52965", "52966", "52967", "52968", "52970", "52975", "52976", "52977", "52978", "52979", "52980", "52985", "52986", "52987", "52988", "52989", "52990", "52994", "52995", "52996", "52997", "52998", "53000", "53010", "53030", "53040", "53050", "53060", "53070", "53100", "53110", "53115", "53116", "53117", "53119", "53120", "53124", "53125", "53126", "53127", "53128", "53129", "53130", "53138", "53140", "53150", "53160", "53170", "53177", "53178", "53179", "53200", "53215", "53216", "53217", "53218", "53219", "53220", "53224", "53227", "53228", "53229", "53230", "53237", "53239", "53240", "53247", "53248", "53250", "53260", "53270", "53278", "53279", "53280", "53283", "53290", "53296", "53297", "53298", "53300", "53309", "53310", "53320", "53329", "53330", "53338", "53339", "53340", "53348", "53350", "53370", "53378", "53390", "53398", "53400", "53410", "53420", "53425", "53426", "53427", "53428", "53430", "53440", "53450", "53458", "53459", "53460", "53470", "53489", "53490", "53500", "53519", "53520", "53529", "53530", "53533", "53550", "53560", "53569", "53570", "53580", "53598", "53640", "53650", "53653", "53654", "53655", "53658", "53659", "53660", "53664", "53670", "53680", "53687", "53688", "53689", "53690", "53694", "53695", "53696", "53697", "53698", "53700", "53708", "53710", "53713", "53714", "53716", "53717", "53718", "53719", "53730", "53760", "53770", "53780", "53787", "53788", "53790", "53798", "53799", "53800", "53809", "53810", "53819", "53820", "53830", "53839", "53840", "53900", "53909", "53910", "53930", "53940", "53950", "53960", "53970", "54400", "54402", "54405", "54407", "54408", "54409", "54410", "54413", "54414", "54416", "54417", "54420", "54424", "54425", "54426", "54430", "54434", "54435", "54439", "54440", "54448", "54449", "54455", "54457", "54459", "54460", "54463", "54464", "54466", "54467", "54469", "54470", "54473", "54474", "54475", "54476", "54477", "54539", "54600", "54602", "54603", "54604", "54605", "54607", "54608", "54610", "54614", "54616", "54640", "54645", "54650", "54655", "54656", "54657", "54658", "54700", "54710", "54712", "54713", "54714", "54715", "54716", "54719", "54720", "54725", "54729", "54730", "54740", "54743", "54744", "54745", "54750", "54753", "54759", "54760", "54763", "54764", "54765", "54766", "54767", "54769")
# nhfipscode <- "33"

# nhdatafile <- "NHD2016.xlsx"
# nhdatafilecsv <- "NHD2016.csv"
# usshapefile <- "cb_2014_us_county_5m/cb_2014_us_county_5m.shp"
# nhfipscode <- "33"
# scdatafile <- "SCGOP2016.csv"
# scfipscode <- "45"

# Load the tmap, tmaptools, and leaflet packages into your working session: 
library("tmaptools")
library("tmap")
library("magrittr")
library("sf")
library("leaflet")
library("leaflet.extras")
library("dplyr")
library("scales")
library("rio")
library("mapview")
library("htmlwidgets")
library("shiny")
# library("plotly")

#### STEP 1: GET ELECTION RESULTS DATA

# Read in the NH election results file:
nomdata <- rio::import(mexnomfile)
# nhdata <- rio::import(nhdatafile)

# If you have any problems with this, there is also a CSV version of the file -- sometimes reading Excel between Mac and Windows can be tricky. Try
# mexdata <- rio::import(mexdatafilecsv)
# nhdata <- rio::import(nhdatafilecsv)

#### STEP 3: GET YOUR GEOGRAPHIC DATA

# Read in the shapefile
nomgeo <- read_shape(file=nomshapefile, as.sf = TRUE)
# usgeo <- read_shape(file=usshapefile, as.sf = TRUE)

# Do a quick plot of the shapefile and check its structure:
qtm(nomgeo)
# qtm(usgeo)

# (pause to wait for map to render, may take a few seconds)
str(nomgeo)
# str(usgeo)

# Subset just the NH data from the US shapefile
ngeo <- nomgeo[nomgeo$d_cp%in%mexzipcode,]
# mgeo <- mexgeo[mexgeo$d_cp==mexfipscode,]
# nhgeo <- usgeo[usgeo$STATEFP==nhfipscode,]
# or 
#mgeo <- dplyr::filter(mexgeo, d_cp == mexfipscode)
# nhgeo <- dplyr::filter(usgeo, STATEFP == nhfipscode)

# tmap test plot of the New Hampshire data
qtm(ngeo)

# structure of the object
str(ngeo)

#### STEP 4: MERGE SPATIAL AND RESULTS DATA

# Check if county names are in the same format in both files
str(ngeo$d_cp)
# str(mexgeo$d_cp)
# str(nhgeo$NAME)
str(nomdata$CP)
# str(nhdata$County)

# They're not. Change the county names to plain characters in nhgeo:
nomdata$CP <- as.character(nomdata$CP)
ngeo$d_cp <- as.character(ngeo$d_cp)
# mgeo$d_cp <- as.numeric(mgeo$d_cp)
# mexgeo$d_cp <- as.numeric(mexgeo$d_cp)
# nhgeo$NAME <- as.character(nhgeo$NAME)

# Order each data set by county name
# nhgeo <- nhgeo[order(nhgeo$NAME),]
# nhdata <- nhdata[order(nhdata$County),]

# Are the two county columns identical now? They should be:
identical(nomgeo$d_cp,nomdata$CP )
# identical(nhgeo$NAME,nhdata$County )

# Merge data with tmaptool's append_data function
nommap <- append_data(ngeo, nomdata, key.shp = "d_cp", key.data="CP")
# nhmap <- append_data(nhgeo, nhdata, key.shp = "NAME", key.data="County")

# See the new data structure with
str(nommap)
# str(nhmap)

#### STEP 5: CREATE A STATIC MAP

# Quick and easy maps as static images with tmap's qtm() function:
# qtm(nommap, CNominacionesRecibidas)
qtm(nommap, "CNominacionesRecibidas")
# qtm(nhmap, "SandersMarginVotes")
# qtm(nhmap, "SandersMarginPctgPoints")

# For more control over look and feel, use the tm_shape() function:
tm_shape(nommap) +
  # tm_fill(CNominacionesRecibidas, title="X. Número de nominaciones recibidas según colonia en C2", palette = "PRGn") +
  tm_fill("CNominacionesRecibidas", title="X. Número de nominaciones recibidas según colonia en C2", palette = "PRGn") +
  tm_borders(alpha=.5) +
  tm_style_classic()

# tm_shape(mexmap) +
# tm_fill("Clasificación total", title="1. Colonia de procedencia del alumnado en C2 según número de estudiantes", palette = "PRGn") +
# tm_borders(alpha=.5) +
# tm_text("d_cp", size=0.8) +
# tm_style_classic()

# tm_shape(nhmap) +
# tm_fill("SandersMarginVotes", title="Sanders Margin, Total Votes", palette = "PRGn") +
# tm_borders(alpha=.5) +
# tm_text("NAME", size=0.8) +
# tm_style_classic()

# tm_shape(nhmap) +
# tm_fill("SandersMarginVotes", title="Sanders Margin, Total Votes", palette = "PRGn") +
# tm_borders(alpha=.5) +
# tm_text("NAME", size=0.8)

# Same code as above, but store the map in a variable:
nomstaticmap <- tm_shape(nommap) +
  # tm_fill(CNominacionesRecibidas, title="X. Número de nominaciones recibidas según colonia en C2", palette = "PRGn") +
  tm_fill("CNominacionesRecibidas", title="X. Número de nominaciones recibidas según colonia en C2", palette = "PRGn") +
  tm_borders(alpha=.5) +
  tm_style_classic()

# nhstaticmap <- tm_shape(nhmap) +
# tm_fill("SandersMarginVotes", title="Sanders Margin, Total Votes", palette = "PRGn") +
# tm_borders(alpha=.5) +
# tm_text("NAME", size=0.8) + 
# tm_style_classic()

# View the map
nomstaticmap
# nhstaticmap

# save the map to a jpg file with tmap's save_tmap():
# save_tmap(mexstaticmap, filename="mexstaticmap1.jpg")
# save_tmap(nhstaticmap, filename="nhdemprimary.jpg")

#### STEP 6: CREATE PALETTE AND POP-UPS FOR INTERACTIVE MAP

# Next up: Code for a basic interactive map, this time for Clinton percentages in NH

# Create a palette
# NomPalette <- colorFactor(palette = "PRGn", domain=nommap$CNominacionesRecibidas, na.color = NA)
NomPalette <- colorFactor(palette = "PRGn", domain=nommap$"CNominacionesRecibidas", na.color = NA)
# StudentsPalette <- colorFactor(palette = "PRGn", domain=mexmap$"Clasificación total", na.color = NA, ordered=TRUE)
# StudentsPalette <- colorFactor(palette = "Red", "Blue", "Brown", "Green", "Pink", "Yellow", domain=mexmap$"Clasificación total")
# clintonPalette <- colorNumeric(palette = "Blues", domain=nhmap$ClintonPct)

# and a pop-up window
# library(scales)
# nompopup <- paste0("<b>CP: ", nommap$d_cp, "</b><br />Colonia: ", nommap$Localidades, ", Municipio: ", nommap$"Municipio corregido", "</b><br />Nominaciones recibidas: ", (nommap$Nominacionesrecibidas))
nompopup <- paste0("<b>CP: ", nommap$d_cp, "</b><br />Colonia: ", nommap$Localidades, ", Municipio: ", nommap$"Municipio corregido", "</b><br />Nominaciones recibidas: ", (nommap$"Nominaciones recibidas"))
# nompopup <- paste0("<b>CP: ", nommap$"d_cp", "</b><br />Colonia: ", nommap$"Localidades", ", Municipio: ", nommap$"Municipiocorregido", "</b><br />Nominaciones recibidas: ", nommap$"Nominacionesrecibidas")
# mxpopup <- paste0("<b>CP: ", mexmap$d_cp, "</b><br />No. de alumnos ", (mexmap$"Total Abs"), "% de alumnos ", (mexmap$"Total Rel"))
# mxpopup <- paste0("<b>CP: ", mexmap$d_cp, "</b><br /># de alumnos: ", mexmap$Total ", % de alumnos: ", mexmap$Total%)
# nhpopup <- paste0("<b>County: ", nhmap$NAME, "</b><br />Sanders ", percent(nhmap$SandersPct), " - Clinton ", percent(nhmap$ClintonPct))

# Rename the county column from NAME to County with dplyr's rename function:
# nhmap <- rename(nhmap, County = NAME)

#### STEP X: 

tag.nommap <- tags$style(HTML("
                              .leaflet-control.nommap { 
                              transform: translate(-50%,20%);
                              position: fixed !important;
                              left: 50%;
                              text-align: center;
                              padding-left: 10px; 
                              padding-right: 10px; 
                              background: rgba(255,255,255,0.75);
                              font-weight: bold;
                              font-size: 28px;
                              }
                              "))

titlenom <- tags$div(
  tag.nommap, HTML("X. Número de nominaciones recibidas según colonia en C2")
) 

#### STEP 7: GENERATE AN INTERACTIVE MAP

# Now the interactive map:
leaflet(nommap) %>%
  addProviderTiles("CartoDB.Positron") %>%
  addPolygons(stroke=FALSE, 
              smoothFactor = 0.2, 
              fillOpacity = .8, 
              popup=nompopup, 
              # color= ~NomPalette(nommap$CNominacionesRecibidas)) %>%
              # color= ~NomPalette(nommap$"CNominacionesRecibidas")) %>%
              color= ~NomPalette(nommap$"CNominacionesRecibidas")) %>%
  # addLegend("bottomright", pal = NomPalette, values = nommap$CNominacionesRecibidas, na.label = "",
  # addLegend("bottomright", pal = NomPalette, values = nommap$"CNominacionesRecibidas", na.label = "",
  addLegend("bottomright", pal = NomPalette, values = nommap$"CNominacionesRecibidas", na.label = "",            
            title = "Nominaciones recibidas",
            opacity = 1) %>%   
  addCircleMarkers(lng = -99.239691, lat = 19.636784, radius = 10,
                   color = "red", label = "CEL", labelOptions = labelOptions(noHide = T, textOnly = TRUE, textsize = "10px", direction = "auto"),
                   stroke = FALSE, fillOpacity = 0.5) %>%
  addControl(titlenom, position = "topleft", className="nommap"
  )

# leaflet(mexmap) %>%
# addProviderTiles("CartoDB.Positron") %>%
# addPolygons(stroke=FALSE, 
# smoothFactor = 0.2, 
# fillOpacity = .8, 
# popup=mxpopup, 
# color= ~StudentsPalette(mexmap$Clasificacióntotal)
# )

# leaflet(nhmap) %>%
# addProviderTiles("CartoDB.Positron") %>%
# addPolygons(stroke=FALSE, 
# smoothFactor = 0.2, 
# fillOpacity = .8, 
# popup=nhpopup, 
# color= ~clintonPalette(nhmap$ClintonPct)
# )

# re-project
# Now the interactive map:
nommap_projected <- sf::st_transform(nommap, "+proj=longlat +datum=WGS84")
leaflet(nommap_projected) %>%
  addProviderTiles("CartoDB.Positron") %>%
  addPolygons(stroke=FALSE, 
              smoothFactor = 0.2, 
              fillOpacity = .8, 
              popup=nompopup, 
              # color= ~NomPalette(nommap$CNominacionesRecibidas)) %>%
              color= ~NomPalette(nommap$"CNominacionesRecibidas")) %>%
  # addLegend("bottomright", pal = NomPalette, values = nommap$CNominacionesRecibidas, na.label = "",
  addLegend("bottomright", pal = NomPalette, values = nommap$"CNominacionesRecibidas", na.label = "",  
            title = "Nominaciones recibidas",
            opacity = 1) %>%   
  addCircleMarkers(lng = -99.239691, lat = 19.636784, radius = 10,
                   color = "red", label = "CEL", labelOptions = labelOptions(noHide = T, textOnly = TRUE, textsize = "10px", direction = "auto"),
                   stroke = FALSE, fillOpacity = 0.5) %>%
  addControl(titlenom, position = "topleft", className="nommap"
  )

# mexmap_projected <- sf::st_transform(mexmap, "+proj=longlat +datum=WGS84")
# leaflet(mexmap_projected) %>%
# addProviderTiles("CartoDB.Positron") %>%
# addPolygons(stroke=FALSE, 
# smoothFactor = 0.2, 
# fillOpacity = .8, 
# popup=mxpopup, 
# color= ~StudentsPalette(mexmap$"Clasificación total")
# )

# mexmap_projected <- sf::st_transform(mexmap, "+proj=longlat +datum=WGS84")
# leaflet(mexmap_projected) %>%
# addProviderTiles("CartoDB.Positron") %>%
# addPolygons(stroke=FALSE, 
# smoothFactor = 0.2, 
# fillOpacity = .8, 
# popup=mxpopup, 
# color= ~StudentsPalette(mexmap$Clasificacióntotal)
# )

# nhmap_projected <- sf::st_transform(nhmap, "+proj=longlat +datum=WGS84")
# leaflet(nhmap_projected) %>%
# addProviderTiles("CartoDB.Positron") %>%
# addPolygons(stroke=FALSE, 
# smoothFactor = 0.2, 
# fillOpacity = .8, 
# popup=nhpopup, 
# color= ~clintonPalette(nhmap$ClintonPct)
# )

#### STEP X:

saveWidget(nommap_projected, file="nominteractivemap1.html", selfcontained=TRUE)
# saveWidget(mexmap_projected, file="mexinteractivemapp.html", selfcontained=TRUE)
# saveWidget(mexmap_projected, file='mexinteractivemap4.html', selfcontained=TRUE)
# htmlwidgets::saveWidget(mexmap_projected, "mexinteractivemap1.html")
# htmlwidgets::createWidget(mexmap_projected, file="mexinteractivemap1.html")
# saveWidget(widget=mexmap_projected, file="mexinteractivemap4.html")
# mapshot(mexmap_projected, url = "mexinteractivemap1.html")
# save as a self-contained HTML file
# save_tmap(mexmap_projected, "mexinteractivemap1.html")
# htmlwidgets::saveWidget(mexmap_projected, file="mexinteractivemap1.html")

# browseURL(nommap_projected)
# browseURL(nominteractivemap1.html)
browseURL("nominteractivemap1.html")

##### Save it  on ploty

#Create a plotly account: https://plot.ly/
#Create API Keys: https://plot.ly/settings/api

# Sys.setenv("plotly_username"="davseg")
# Sys.setenv("plotly_api_key"="Diciembre1")
# Sys.setenv("plotly_username"="USERNAME")
# Sys.setenv("plotly_api_key"="PASSWORD")

#Save to online file
# api_create(mexmap_projected, filename = "mexinteractivemap4")

# addLegend(position="bottomleft", colors=~StudentsPalette, labels=mexmap$"Clasificación total")
# addLegend(position="bottomleft", colors=~StudentsPalette, labels=mexmap$"Clasificación total")
# addLegend(position="bottomleft", colors=c("#984ea3", "#e41a1c"), labels=c("Trump", "Rubio"))

# To save
# dev.copy(jpeg,filename="map_group.jpg");
# dev.off ()

# To export data from environment window
# files <- mget(ls())
# for (i in 1:length(files)){
# write.csv(files[[i]], paste(names(files[i]), ".csv", sep = ""))
# }

# set.seed(1); plot(net.all, layout=layout_with_fr, edge.color="gray", edge.arrow.size=.0005, edge.lty="solid", edge.curved=0.4, vertex.shape="circle", vertex.label=NA, vertex.size=3)

