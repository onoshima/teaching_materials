# 連続一様分布の関数
source("init.R")
a <- 0
b <- 1

x <- seq(a, b, length.out = 100)
y <- dunif(x, min = a, max = b)
fx <- dunif(a, min = a, max = b)
sidespace <- b - 1 * 0.5
dat <- tibble(x, y)

p <- ggplot(data = dat, aes(x = x, y =y)) +
  geom_line() + 
  #geom_point(aes(x = a, y = fx)) +
  #geom_point(aes(x = b, y = fx)) +
  geom_segment(x = a - sidespace, xend = a, y = 0, yend = 0) +
  geom_segment(x = b, xend = b + sidespace, y = 0, yend = 0) +
  #geom_point(aes(x = a, y = 0), shape = 1) +
  #geom_point(aes(x = b, y = 0), shape = 1) +
  scale_x_continuous(limits = c(a - sidespace, b + sidespace)) +
  scale_y_continuous(limits = c(0, max(y) * 1.5),
                     breaks = seq(0,  max(y) * 1.4 , 0.2)) +
  labs(y = "f(x)")
p
ggsave("fig/unif_cont1.pdf", device = cairo_pdf)

