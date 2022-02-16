data <- cars
for(i in 1:5){
  expect_equal(create_clusters(cars,i), kmeans(cars,i))
}