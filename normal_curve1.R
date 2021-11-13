# 正規分布の確率密度
library(tidyverse)
library(fontregisterer)
family_sans <- "Hiragino Sans"
theme_set(theme_light(base_family = family_sans))

x <- seq(-3.5, 3.5, length.out = 100)
fx <- dnorm(x)

dat <- tibble(x, fx)

p <- ggplot(dat, aes(x = x, y = fx)) +
  geom_line() +
  scale_y_continuous(limits = c(0, 0.5)) +
  labs(y = "f(x)")
p
ggsave("fig/normal_curve1.pdf", device = cairo_pdf)
