# 正規分布の確率密度
library(tidyverse)
library(fontregisterer)
family_sans <- "Hiragino Sans"

theme_set(theme_light(base_family = family_sans))

x <- seq(-3.5, 3.5, length.out = 100)
fx <- dnorm(x)

dat <- tibble(x, fx)
xlab <- expression(mu) 
p <- ggplot(dat, aes(x = x, y = fx)) +
  geom_line(size = 1) +
  scale_y_continuous(limits = c(0, 0.45)) +
  scale_x_continuous(breaks = seq(-3, 3, 1),
                     labels = c(expression(mu - 3),
                                expression(mu - 2),
                                expression(mu - 1),
                                expression(mu ),
                                expression(mu + 1),
                                expression(mu + 2),
                                expression(mu + 3))) +
  geom_segment(x = -4, y = 0, xend = 4, yend = 0, size = 0.4) +
  geom_segment(x = 0, xend = 0, y = 0, yend = dnorm(0), size = 0.4) +
  geom_segment(x = 1, xend = 1, y = 0, yend = dnorm(1), size = 0.4) +
  geom_segment(x = 0.5, xend = 1, y = dnorm(1), yend = dnorm(1), size = 0.4,
               arrow = arrow(length=unit(0.25, "cm" ))) +
  geom_segment(x = 0.5, xend = 0, y = dnorm(1), yend = dnorm(1), size = 0.4,
               arrow = arrow(length=unit(0.25, "cm" ))) +
  annotate("text", x = 0.5, y = 0.25, label = expression(sigma)) +
  annotate("text", x = -1.6, y = 0.01, label = expression(a)) +
  annotate("text", x = -0.4, y = 0.01, label = expression(b)) +
  geom_segment(x = -2.5, xend = -1, y = 0.25, yend = 0.15, size = 0.4,
               arrow = arrow(length=unit(0.25, "cm" ))) +
  annotate("text", x = -2.5, y = 0.26, parse = TRUE, label = "P({a < x}<=b)") +
  labs(y = "f(x)") +
  geom_ribbon(data=data.frame(X=x<-seq(-1.5, -0.5,len=101), 
                                     Y=dnorm(x)), aes(x=X, y=Y, ymin=0, ymax=Y),
                     fill = "blue", alpha = 0.50)
p
ggsave("fig/normal_curve2.pdf", device = cairo_pdf)
