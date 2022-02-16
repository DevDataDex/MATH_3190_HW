data <- cars

for(i in 1:5){
  expect_equal(
    plot_clusters(cars,kmeans(cars,i)),
    plot(cols,
         col = kmeans$cluster,
         pch = 20, cex = 3)
    points(kmeans$centers, pch = 4, cex = 4, lwd = 4)
    )
}