library(ggplot2)

# Define the constraints as functions
constraint1 <- function(x) (2000 - 5*x)   # Blue Line
constraint2 <- function(x) (1100 - x)      # Green Line
constraint3 <- function(x) (75000 - 100*x) / 60  # Red Line


# Generate x values
x_vals <- seq(0, 1000, length.out = 100)

# Compute corresponding y values
y1 <- constraint1(x_vals)
y2 <- constraint2(x_vals)
y3 <- constraint3(x_vals)

# Feasible region
feasible_x <- c(0, 0, 225, 400)
feasible_y <- c(0, 1100, 875, 0)

# Create plot
ggplot() +
  geom_line(aes(x_vals, y1), color = "blue", size = 1) +
  geom_line(aes(x_vals, y2), color = "green", size = 1) +
  geom_line(aes(x_vals, y3), color = "red", size = 1) +
  geom_polygon(aes(feasible_x, feasible_y), fill = "lightgreen", alpha = 0.3) +
  geom_point(aes(x = 225, y = 875), color = "red", size = 3) +
  
  # Display constraint equations
  annotate("text", x = 300, y = 1500, label = "Water Supply: 5X + Y = 2000", color = "blue", size = 4) +
  annotate("text", x = 900, y = 450, label = "Farming Area: X + Y = 1100", color = "green", size = 4) +
  annotate("text", x = 950, y = 100, label = "Profit:100X + 60Y = 75000 (max)", color = "red", size = 4) +
  
  annotate("text", x = 210, y = 925, label = "Optimal Choice: (225,875)", 
           color = "red", hjust = -0.1) +
  labs(x = "X (Sugar beets)",
       y = "Y (Corn)") +
  coord_cartesian(xlim = c(0, 1200), ylim = c(0, 2000)) +  # Adjusted axis limits
  theme_minimal()
