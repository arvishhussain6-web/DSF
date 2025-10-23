library (ggplot2)
# ------------------------------------------------------------
# Comprehensive Lecture: Grammar of Graphics in R with ggplot2
# Dataset: datasets::islands
# ------------------------------------------------------------

library(ggplot2)

# Convert 'islands' (named vector) into a dataframe
islands_df <- data.frame(
  Island = names(islands),
  Area = as.numeric(islands)
)

# ------------------------------------------------------------
# 1. Explore the dataset
head(islands_df)  # First few rows: Island + Area (1000 sq miles)

# ------------------------------------------------------------
# 2. Initialize ggplot (blank canvas with aesthetics)
ggplot(islands_df, aes(x = Island, y = Area))

# ------------------------------------------------------------
# 3. Basic bar chart (island areas)
ggplot(islands_df, aes(x = reorder(Island, -Area), y = Area)) +
  geom_bar(stat = "identity") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

# ------------------------------------------------------------
# 4. Add statistical transformation: histogram of areas
ggplot(islands_df, aes(x = Area)) +
  geom_histogram(bins = 15, fill = "lightblue", color = "black") +
  labs(title = "Distribution of Island Areas")

# ------------------------------------------------------------
# 5. Customizing with color scale
top10 <- head(islands_df[order(-islands_df$Area), ], 10)
ggplot(top10, aes(x = reorder(Island, Area), y = Area, fill = Island)) +
  geom_bar(stat = "identity") +
  scale_fill_brewer(palette = "Set3") +
  coord_flip() +
  labs(title = "Top 10 Largest Islands")

# ------------------------------------------------------------
# 6. Coordinate system: Pie chart of largest 8 islands
top8 <- head(islands_df[order(-islands_df$Area), ], 8)
ggplot(top8, aes(x = "", y = Area, fill = Island)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar(theta = "y") +
  labs(title = "Proportion of Largest 8 Islands")
aza
# ------------------------------------------------------------
# 7. Faceting (divide histogram into bins by size category)
islands_df$SizeCat <- cut(islands_df$Area,
                          breaks = c(0, 50, 500, 2000, 10000, Inf),
                          labels = c("Tiny", "Small", "Medium", "Large", "Huge"))
ggplot(islands_df, aes(x = Area)) +
  geom_histogram(bins = 10, fill = "orange", color = "black") +
  facet_wrap(~ SizeCat, scales = "free_y") +
  labs(title = "Island Areas Faceted by Size Category")

# ------------------------------------------------------------
# 8. Apply theme + labels
ggplot(islands_df, aes(x = reorder(Island, -Area), y = Area)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  theme_minimal() +
  labs(title = "Areas of Islands", x = "Island", y = "Area (1000 sq miles)")

# ------------------------------------------------------------
# 9. Advanced customization + annotation
ggplot(islands_df, aes(x = seq_along(Area), y = Area, size = Area)) +
  geom_point(alpha = 0.6, color = "darkgreen") +
  scale_size_continuous(range = c(2, 8)) +
  annotate("text", x = which(islands_df$Island == "Greenland"),
           y = islands_df$Area[islands_df$Island == "Greenland"] + 500,
           label = "Greenland", color = "red") +
  labs(title = "Island Areas with Greenland Highlighted",
       x = "Index", y = "Area")

# ------------------------------------------------------------
# 10. Saving a plot
p <- ggplot(top10, aes(x = reorder(Island, Area), y = Area, fill = Island)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  theme_bw() +
  labs(title = "Top 10 Largest Islands", x = "Island", y = "Area")

ggsave("top10_islands.png", plot = p, width = 8, height = 6, dpi = 300)

