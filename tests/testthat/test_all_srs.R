context("Forest sampling statistics calculations: all simple random samples")


test_that("all srs function handles basic simple random sample", {
  data <- data.frame(
    bapa = c(120, 140, 160, 110, 100, 90),
    plots = c(1, 2, 3, 4, 5, 6)
  )

  expect_equal(summarize_all_srs(data,
    attribute = "bapa", popSize = 40,
    infiniteReplacement = F
  ),
  summarize_simple_random(data,
    attribute = "bapa", popSize = 40,
    infiniteReplacement = F
  ),
  tolerance = 0.1
  )
})


test_that("all srs function handles simple random sample for discrete attribute, Bernoulli", {
  data <- data.frame(
    alive = c(T, T, F, T, F, F),
    tree = c(1, 2, 3, 4, 5, 6)
  )

  expect_equal(summarize_all_srs(data,
    attribute = "alive", popSize = 50,
    desiredConfidence = 0.95, infiniteReplacement = F, bernoulli = T
  ),
  summarize_simple_random_discrete(data,
    attribute = "alive", popTot = 50,
    desiredConfidence = 0.95
  ),
  tolerance = 0.1
  )
})
