# 2項分布の分布関数
source("init.R")

n <- 5
pi <- 0.6

x <- 0:n
y <- dbinom(x, n, pi)
dat <- tibble(x, y) %>%
  mutate(x = as.character(x))
p <- ggplot(dat, aes(x = x, y = y)) +
  geom_bar(stat = "identity") +
  scale_x_discrete(labels = x) +
  scale_y_continuous(breaks = seq(0, 0.4, 0.05)) +
  labs(y = "P(X = x)")
p
ggsave("fig/binomial1.pdf", device = cairo_pdf)

n <- 10
pi <- 0.3

x <- 0:n
y <- dbinom(x, n, pi)
dat <- tibble(x, y) %>%
  mutate(x = as.factor(x))
p <- ggplot(dat, aes(x = x, y = y)) +
  geom_bar(stat = "identity") +
  scale_x_discrete(labels = x) +
  scale_y_continuous(breaks = seq(0, 0.3, 0.05)) +
  labs(y = "P(X = x)")
p
ggsave("fig/binomial2.pdf", device = cairo_pdf)

n <- 20
pi <- 0.9

x <- 0:n
y <- dbinom(x, n, pi)
dat <- tibble(x, y) %>%
  mutate(x = as.factor(x))
p <- ggplot(dat, aes(x = x, y = y)) +
  geom_bar(stat = "identity") +
  scale_x_discrete(labels = x) +
  scale_y_continuous(breaks = seq(0, 0.3, 0.05)) +
  labs(y = "P(X = x)")
p
ggsave("fig/binomial3.pdf", device = cairo_pdf)
