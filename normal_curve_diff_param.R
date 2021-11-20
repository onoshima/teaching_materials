# 平均や分散の異なる正規分布
source("init.R")

x0 <- seq(-6, 8, 0.05)
fx1 <- dnorm(x0, mean = 0, sd = 1)
fx2 <- dnorm(x0, mean = 3, sd = 1)
fx3 <- dnorm(x0, mean = -2, sd = 1)

fx <- c(fx1, fx2, fx3)
mu <- rep(c("mu0", "mu3", "mu-2"), each = length(x0))
mu <- factor(mu, levels = c("mu0", "mu3", "mu-2"))
x <- rep(x0, 3)

p1 <- ggplot(tibble(x, fx, mu), aes(x = x, y = fx, linetype = mu)) +
  geom_line() +
  scale_linetype_manual(
    name = NULL,
    values = c(1, 2, 3),
    breaks = c("mu0", "mu3", "mu-2"),
    labels = c(expression(mu==0),
               expression(mu==3),
               expression(mu== -2))) +
  labs(x = "x", y = "f(x)") +
  theme(legend.position = c(1, 1),
        legend.justification = c(1, 1),
        legend.background = element_rect(fill = NA, colour = NA))
p1
ggsave("fig/normal_diff_mu.pdf", device = cairo_pdf,
       width = 10, height = 5, units = "cm")

# SDを変えた正規分布
y0 <- seq(-15, 15, 0.05)
fy1 <- dnorm(y0, mean = 0, sd = 1)
fy2 <- dnorm(y0, mean = 0, sd = 2)
fy3 <- dnorm(y0, mean = 0, sd = 5)

fy <- c(fy1, fy2, fy3)
SD <- rep(c("sd1", "sd2", "sd3"), each = length(y0))
y <- rep(y0, 3)

p2 <- ggplot(tibble(y, fy, SD), aes(x = y, y = fy, linetype = SD)) +
  geom_line() +
  scale_linetype_manual(
    name = NULL,
    values = c(1, 2, 3),
    breaks = c("sd1", "sd2", "sd3"),
    labels = c(expression(sigma==1),
               expression(sigma==2),
               expression(sigma==5))) +
  labs(x = "y", y = "f(y)") +
  theme(legend.position = c(1, 1),
        legend.justification = c(1, 1),
        legend.background = element_rect(fill = NA, colour = NA))
p2

ggsave("fig/normal_diff_sd.pdf", device = cairo_pdf,
       width = 10, height = 5, units = "cm")
