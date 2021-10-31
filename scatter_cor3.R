# 外れ値の影響を示す散布図
library(tidyverse)
library(fontregisterer)
library(mvtnorm)
family_serif <- "Times New Roman"
family_sans <- "Arial"
theme_set(theme_light(base_family = family_sans))

# データの生成
set.seed(1234)
n <- 50
dat <- rmvnorm(n, sigma = matrix(c(1, 0, 0, 1), ncol = 2))
dat[50, ] <- c(7, 7)

dat <- as_tibble(dat)

# 散布図生成
p <- ggplot(dat, aes(x = V1, y = V2)) +
  geom_point(size = 2) +
  scale_x_continuous(limits = c(-4, 8)) +
  scale_y_continuous(limits = c(-4, 8)) +
  theme(legend.position = "none",
        axis.title = element_blank(),
        axis.ticks = element_blank(),
        axis.text = element_blank(),
        plot.margin = margin(0.5, 0.5, 0.5, 0.5))
p
ggsave("fig/scatter_cor3.pdf", device = cairo_pdf,
       width = 10, height = 10, units = "cm")