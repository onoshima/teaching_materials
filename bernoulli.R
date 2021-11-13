# ベルヌイ分布の分布関数
source("init.R")

pi <- 0.6

x <- c("0", "1")
y <- c(1 - pi, pi)
dat <- tibble(x, y)

p <- ggplot(dat, aes(x = x, y = y)) +
  geom_bar(stat = "identity") +
  scale_y_continuous(limits = c(0, 1), breaks = seq(0, 1, 0.2)) +
  labs(y = "P(X = x)")
p
ggsave("fig/bernoulli.pdf", device = cairo_pdf)