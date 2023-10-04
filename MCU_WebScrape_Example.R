# Package from Tidyverse used for webscraping
library(rvest)


# Save website we want data from
html <- read_html("https://www.the-numbers.com/movies/franchise/Marvel-Cinematic-Universe#tab=summary")


# Our data is in a nice table so we can easily grab it using the functions below
# html_element allows us to add in the css/xpath tag for our table. Here, our tag is "franchise_movies_overview".
# html_table() allows us to return a table of our data inside R. It's basically a list of tibbles that contain our css/xpath tag from above.
data <- html %>% 
  # "*" is used to mean "Contains..." so we are basically telling the css selector to select all elements conatining francise_movies_overview
  html_element("*#franchise_movies_overview") %>% 
  html_table()
data


# Save results to csv file
write.csv(data, 'mcu_box_office_data.csv',row.names = FALSE)


html <- minimal_html("
  <h1>This is a heading</h1>
  <p id='first'>This is a paragraph</p>
  <p class='important'>This is an important paragraph</p>
")

html %>% html_element("h1")
html %>% html_elements("p")
html %>% html_elements(".important")
html %>% html_elements("#first") %>% html_table()
