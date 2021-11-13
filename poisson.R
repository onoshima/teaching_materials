# ポアソン分布の確率分布
source("init.R")
x <- 0:20
lambda <- 1
y <- dpois(x, lambda)
dat <- tibble(x, y)

p1 <- ggplot(dat, aes(x = x, y = y)) +
  geom_bar(stat = "identity") +
  scale_y_continuous(limits = c(0, 0.4)) +
  labs(y = "P(X = x)")
p1
ggsave("fig/poisson1.pdf", device = cairo_pdf)

lambda <- 4
y <- dpois(x, lambda)
dat <- tibble(x, y)

p2 <- ggplot(dat, aes(x = x, y = y)) +
  geom_bar(stat = "identity") +
  scale_y_continuous(limits = c(0, 0.4)) +
  labs(y = "P(X = x)")
p2
ggsave("fig/poisson2.pdf", device = cairo_pdf)

lambda <- 10
y <- dpois(x, lambda)
dat <- tibble(x, y)

p3 <- ggplot(dat, aes(x = x, y = y)) +
  geom_bar(stat = "identity") +
  scale_y_continuous(limits = c(0, 0.4)) +
  labs(y = "P(X = x)")
p3
ggsave("fig/poisson3.pdf", device = cairo_pdf)


