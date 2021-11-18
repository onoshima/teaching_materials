# 2項分布の正規分布近似
source("init.R")
library(patchwork)
plot_point_and_verline <- function (n, prob) {
  x <- 0:n
  px <-  dbinom(x, n, prob)
  dat <- tibble(x, px)
  
  np <- n * prob
  npq <- n * prob * (1 - prob)
  
  ggplot(dat, aes(x = x, y = px)) +
    geom_segment(aes(x = x, xend = x, y =0 , yend = px)) +
    scale_x_continuous(limits = c(np - 4 * sqrt(npq), np + 4 * sqrt(npq))) +
    labs(y = "p(x)")
}

p1 <- plot_point_and_verline(10, 0.7)
p1
ggsave("fig/binom_normal_n10p07.pdf",units = "cm", width = 10, height = 5,
       device = cairo_pdf)
p2 <- plot_point_and_verline(20, 0.7)
p2
ggsave("fig/binom_normal_n20p07.pdf",units = "cm", width = 10, height = 5,
       device = cairo_pdf)
p3 <- plot_point_and_verline(100, 0.7)
p3
ggsave("fig/binom_normal_n100p07.pdf",units = "cm", width = 10, height = 5,
       device = cairo_pdf)
p4 <- plot_point_and_verline(1000, 0.7)
p4
ggsave("fig/binom_normal_n1000p07.pdf",units = "cm", width = 10, height = 5,
         device = cairo_pdf)

# 4枚をまとめたもの
p1 + p2 + p3 + p4 +
  plot_layout(ncol = 1)
ggsave("fig/binom_normal_p07.pdf",units = "cm", width = 12, height = 12,
       device = cairo_pdf)

