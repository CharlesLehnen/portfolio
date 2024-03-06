library(shiny)
library(leaflet)
library(dplyr)

# 1) make icon using ChatGPT and then remove background with www.remove.bg, download to folder images/icons
# 2) add name of icon, lat/lon, and project description to documents/projects.csv
# 3) run code chunk in code/watermark.ipynb to generate R code snippet
# 4) paste that code chunk into the server.R script
# 5) run rsconnect::deployApp('code/shiny_map') in R console for the folder that includes the ui.R and server.R scripts
# (rmarkdown based deployment was giving me issues)

server <- function(input, output, session) {
  
  COTOIcon <- makeIcon(
    iconUrl = "https://raw.githubusercontent.com/CharlesLehnen/portfolio/main/images/icons/COTO.png",
    iconWidth = 50, iconHeight = 50,
    iconAnchorX = 25, iconAnchorY = 50
  )
  
  blandingsIcon <- makeIcon(
    iconUrl = "https://raw.githubusercontent.com/CharlesLehnen/portfolio/main/images/icons/blandings.png",
    iconWidth = 50, iconHeight = 50,
    iconAnchorX = 25, iconAnchorY = 50
  )
  
  GalapTortIcon <- makeIcon(
    iconUrl = "https://raw.githubusercontent.com/CharlesLehnen/portfolio/main/images/icons/GalapTort.png",
    iconWidth = 50, iconHeight = 50,
    iconAnchorX = 25, iconAnchorY = 50
  )
  
  flyIcon <- makeIcon(
    iconUrl = "https://raw.githubusercontent.com/CharlesLehnen/portfolio/main/images/icons/fly.png",
    iconWidth = 50, iconHeight = 50,
    iconAnchorX = 25, iconAnchorY = 50
  )
  
  arthropodsIcon <- makeIcon(
    iconUrl = "https://raw.githubusercontent.com/CharlesLehnen/portfolio/main/images/icons/arthropods.png",
    iconWidth = 50, iconHeight = 50,
    iconAnchorX = 25, iconAnchorY = 50
  )
  
  elmIcon <- makeIcon(
    iconUrl = "https://raw.githubusercontent.com/CharlesLehnen/portfolio/main/images/icons/elm.png",
    iconWidth = 50, iconHeight = 50,
    iconAnchorX = 25, iconAnchorY = 50
  )
  
  JEPIcon <- makeIcon(
    iconUrl = "https://raw.githubusercontent.com/CharlesLehnen/portfolio/main/images/icons/JEP.png",
    iconWidth = 50, iconHeight = 50,
    iconAnchorX = 25, iconAnchorY = 50
  )
  
  mojaveIcon <- makeIcon(
    iconUrl = "https://raw.githubusercontent.com/CharlesLehnen/portfolio/main/images/icons/mojave.png",
    iconWidth = 50, iconHeight = 50,
    iconAnchorX = 25, iconAnchorY = 50
  )
  output$map <- renderLeaflet({
    leaflet() %>%
      addProviderTiles("Esri.NatGeoWorldMap") %>%
      addMarkers(
        lng = -107.303802, 
        lat = 33.12007, 
        popup = "We evaluated the ecological significance of abandoned mines in New Mexico as habitats for bats to recommend them for closure or federal protection. This included the collection of habitat, LiDAR imagery, and disease metrics. Field techniques involved off-roading, hiking, and ropework, with additional avian surveys at mine closures.<a href='https://www.esri.com/about/newsroom/arcnews/where-the-bats-go/' target='_blank'>Read More</a>", 
        icon = COTOIcon
      ) %>%
      
      addMarkers(
        lng = -92.161371, 
        lat = 43.880424, 
        popup = "I independently monitored nesting sites of the endangered Blanding's Turtles at Murphy-Hanrehan Park, assisting with road crossings, health observations, photographic documentation, and egg translocation relocation since Blanding's exhibit natal homing", 
        icon = blandingsIcon
      ) %>%
      
      addMarkers(
        lng = -95.810074, 
        lat = -0.344018, 
        popup = "My doctoral research, in collaboration with the Galapagos Conservancy and Iniciativa Galápagos, explores the impact of introducing Española Giant Tortoises to Santa Fe Island to restore its ecosystem. Using drone imagery, isotope analysis, and camera traps, this project aims to take a mult-faceted approach to quantify the cascading ecological effects on this introduction. <a href='https://eos-gnss.com/successes/galapagos' target='_blank'>Read More</a>", 
        icon = GalapTortIcon
      ) %>%
      
      addMarkers(
        lng = -88.352343, 
        lat = -0.382326, 
        popup = "I spearheaded a 4-year comprehensive study on the natural history across five Galapagos islands, significantly contributing to the Philornis Working Group's efforts against the invasive Philornis downsi fly. This work, pivotal for understanding the ecology of Galapagos Diptera, informed P. downsi control strategies and non-target biocontrol testing. Previously, the reproductive ecology of Galapagos Diptera were largely unknown.", 
        icon = flyIcon
      ) %>%
      
      addMarkers(
        lng = -120.89189, 
        lat = 37.430757, 
        popup = "In collaboration with the Los Angeles Natural History Museum (NHM) and Cal State, we examined the impact of various factors on arthropod diversity across Los Angeles, analyzing topographical, abiotic, and anthropogenic drivers. We explored the complex responses within and between six arthropod groups, revealing high regional diversity and variable spatial composition. This research underscores the nuanced relationship between urban development and biodiversity, contributing valuable insights for urban ecology and land management practices.<a href='https://www.nature.com/articles/s41598-023-50675-3' target='_blank'>Read More</a>", 
        icon = arthropodsIcon
      ) %>%
      
      addMarkers(
        lng = -95.146029, 
        lat = 48.112037, 
        popup = "I assisted in research on Dutch elm disease, nursery techniques, and urban forestry, gaining expertise in plant propagation and tree care, from seed to adult tree. Collaborating closely with Saint Paul Parks and Recreation foresters, I collected seeds and collected data across study sites. I managed 8 acres of nursery and experimental plots.", 
        icon = elmIcon
      ) %>%
      
      addMarkers(
        lng = -116.4529, 
        lat = 33.978195, 
        popup = "I led the WonderKids virtual afterschool program, creating and implementing a semester long STEM curriculum for K-5 students that highlights diversity in science with guest speakers and virtual lab tours. This approach aimed to inspire students through hands-on experiments and exposure to a variety of specific scientific careers, emphasizing inclusivity in science education. <a href='https://www.youtube.com/playlist?list=PLU0ue4Xv_K1udN1Nd_DUlmonps7cAh9EG' target='_blank'>Watch my lessons Here</a>", 
        icon = JEPIcon
      ) %>%
      
      addMarkers(
        lng = -112.123846, 
        lat = 40.359941, 
        popup = "For USFWS, I collected georeferenced biometric data on vulnerable Mojave desert tortoise populations across Nevada using line-distance sampling, adhering to sterile techniques. This included assessing body condition scores, checking for Mycoplasma infection, and taking morphological measurements, with strict protocols to prevent hypothermia, dehydration, and disease spread among tortoises.", 
        icon = mojaveIcon
      ) 
  })     
}