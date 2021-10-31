# 層別相関の散布図
# 各層は負の相関で全体は正の相関の散布図
library(tidyverse)
library(fontregisterer)
library(mvtnorm)
family_serif <- "Times New Roman"
family_sans <- "Arial"
theme_set(theme_light(base_family = family_sans))

# データの生成
set.seed(1234)
n <- 100
rho1 <- -0.7
rho2 <- -0.8
mu1 <- c(-1.5, -1.5)
mu2 <- c(1.5, 1.5)
r_total <- 0.5
condition_met <- FALSE
while (!condition_met) { 
  dat1 <- rmvnorm(n, mean = mu1, sigma = matrix(c(1, rho1, rho1, 1), ncol = 2))
  dat2 <- rmvnorm(n, mean = mu2, sigma = matrix(c(1, rho2, rho2, 1), ncol = 2))
  dat <- as_tibble(rbind(dat1, dat2)) %>%
    mutate(group = c(rep("A", n), rep("B", n)))
  cond1_met <- abs(cor(dat1)[2] - rho1) < 0.005
  cond2_met <-  abs(cor(dat2)[2] - rho2) < 0.005
  cond3_met <- abs(cor(dat[, 1:2])[2] - r_total) < 0.005
  condition_met <- cond1_met & cond2_met & cond3_met
}

# 散布図生成
p <- ggplot(dat, aes(x = V1, y = V2, shape = group)) +
  geom_point(size = 2) +
  theme(legend.position = "none",
        axis.title = element_blank(),
        axis.ticks = element_blank(),
        axis.text = element_blank(),
        plot.margin = margin(0.5, 0.5, 0.5, 0.5))
p
ggsave("fig/scatter_cor2.pdf", device = cairo_pdf,
       width = 10, height = 10, units = "cm")