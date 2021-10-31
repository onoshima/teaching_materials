# 単位円の散布図
# 相関は0に近くとも独立でない例
library(tidyverse)
library(mvtnorm)
theme_set(theme_light(base_family = family_sans))
set.seed(1234)

n <- 100
x　<- runif(n, min = -1, max = 1)
y <- numeric()
y[1:50] <- sqrt(1 - x[1:50]^2) + rnorm(n/2, sd = 0.1)
y[51:100] <- - sqrt(1 - x[51:100]^2) + rnorm(n/2, sd = 0.1)

round(cor(x, y), 3) # -0.078

dat <- tibble(x, y)
p <- ggplot(dat, aes(x = x, y = y)) +
  geom_point(size = 2) +
  scale_x_continuous(limits = c(-1.3, 1.3)) +
  scale_y_continuous(limits = c(-1.3, 1.3))
p
ggsave("fig/scatter_cor3.pdf", device = cairo_pdf,
       width = 10, height = 10, units = "cm")