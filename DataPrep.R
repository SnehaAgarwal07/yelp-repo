con <- dbConnect(RMySQL::MySQL(), host="localhost",user="root",password="root",dbname="Yelp")

business <- tbl(con,"business")
reviews <- tbl(con, "reviews")
business_attr <- tbl(con,"business_attr")
users <- tbl(con,"users")

business <- rename(business, stars_b = stars)

reviews <- rename(reviews, stars_r = stars)

data <- business %>%
  filter(str_detect(categories,"Restaurant"))%>%
  filter(city=="Las Vegas")%>%
  left_join(reviews,by="business_id")

