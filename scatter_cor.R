# 相関散布図
library(tidyverse)
library(fontregisterer)
library(mvtnorm)
family_serif <- "Times New Roman"
family_sans <- "Arial"
theme_set(theme_light(base_family = family_serif))

# データ生成
set.seed(1234)
n <- 200
rho <- c(-1, -0.8, -0.5, -0.2, 0, 0.2, 0.5, 0.8, 1)
r_order <- str_c("italic(r) == ", rho)
dat <- tibble(rho = character(), x = numeric(), y = numeric())

for (ite in 1:length(rho)) {
  cor_check <- TRUE
  while (cor_check) {
    temp <- rmvnorm(n, sigma = matrix(c(1, rho[ite], rho[ite], 1), nrow = 2))
    if (abs(cor(temp)[2] - rho[ite]) < 0.005) {
      cor_check <- FALSE
    }
  }
  temp <- as_tibble(temp) %>%
    mutate(rho = rep(str_c("italic(r) == ", rho[ite]), n))
  colnames(temp) <- c("x", "y", "rho")
  dat <- bind_rows(dat, temp)
}
dat <- dat %>%
  mutate(rho = factor(rho, levels = r_order))

# 相関の確認
dat %>%
  group_by(rho) %>%
  summarize(r = cor(x, y))

# 散布図
p <- ggplot(dat, aes(x = x, y = y)) +
  geom_point() +
  theme(axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        strip.background = element_rect(fill="gray30")) +
  labs(x = "", y = "") +
  facet_wrap("rho", labeller = label_parsed)
p
ggsave("fig/scatter_cor.pdf", device = cairo_pdf,
       width = 15, height = 12, units = "cm")