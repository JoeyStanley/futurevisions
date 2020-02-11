#' Access Visions of the Future color palettes
#'
#' @description
#' This function returns one of several color palettes based on the Visios of the Future
#' poster series developed by NASA's Jet Propulsion Laboratory at the California Institute
#' of Technology. For more information, including links free to full-sized versions of the
#' posters, please see https://www.jpl.nasa.gov/visions-of-the-future/
#'
#' @param palette A string.
#'
#' @return A vector of colors in hexidecimal formant.
#'
#' @details
#' Current options are "venus", "earth", "mars", "jupiter",
#' "ceres", "enceladus", "europa", "titan",
#' "cancri", "hd", "kepler186", "kepler 16b", "pegasi", "pso", "trappest",
#' grand_tour", "atomic_clock", "atomic_red", "atomic_blue", and "atomic_orange".
#'
#' @examples
#' futurevisions("mars")
#' futurevisions("pso")
#'
#' require(ggplot2)
#' ggplot(mpg, aes(cty, hwy, color = factor(cyl))) +
#'    geom_jitter() +
#'    scale_color_manual(values = futurevisions("mars"))

futurevisions <- function(palette) {

  switch(as.character(tolower(palette)),

         # Planets
         "venus"   = c("#EDB992", "#FEF9F4", "#6B8A8D", "#ABAAA6", "#4B5453"),
         "earth"   = c("#3B4B42", "#75AC42", "#B0D9CB", "#FFFFFE", "#FCF063", "#935932", "#642E2A"),
         "mars"    = c("#DB3A2F", "#EAB33A", "#275D8E", "#902A57", "#F7EBD3", "#0B0C0B"),
         "jupiter" = c("#882B6A", "#EB9FAF", "#4E9678", "#303251", "#0C0D0E", "#BDC1D4"),

         # Moons
         "ceres"     = c("#F8F9FA", "#6F8BA0", "#4A5F71", "#181D20"),
         "enceladus" = c("#1C1113", "#1A2A29", "#D1DCCE", "#5D1722", "#CE512C"),
         "europa"    = c("#030F1E", "#253473", "#4982B6", "#8CCCE4", "#DFEBF1"),
         "titan"     = c("#0C0C0B", "#58271A", "#752021", "#DF5730", "#DC942F", "#FDEE92"),

         # Exo-planets
         "cancri"    = c("#343854", "#8C384D", "#CF2438", "#D95E31", "#F0C742", "#F8F0E5"),
         "hd"        = c("#3C659A", "#A0B8C3", "#BC9E51", "#67A850", "#3E5B59", "#2D332D"),
         "kepler186" = c("#803233", "#ED3F39", "#E46844", "#DC876C", "#FEFEFE", "#ADD0B5", "#8FA3AB", "#484357", "#303638"),
         "kepler16b" = c("#FEFEFE", "#FFEFA9", "#FAAC51", "#6A5188", "#C77998", "#A24745", "#462F2F"),
         "pegasi"    = c("#552F31", "#DC363B", "#EE5D36", "#EFCF40", "#698E7C", "#315886", "#2B2D2D", "#CBB193"),
         "pso"       = c("#272727", "#383955", "#61619B", "#BDC6DC", "#FBFAFA"),
         "trappest"  = c("#0E100F", "#181223", "#2D2546", "#723349", "#D32930", "#111E33", "#273973", "#4882B6"),

         # Other
         "grand_tour"    = c("#418D87", "#2B5E3D", "#73224E", "#AD2E37", "#E37D41", "#E9A144", "#F6EBD1"),
         "atomic_clock"  = c("#09283C","#3CC8C0", "#F2EBBB", "#F18B00", "#CB1724"),
         "atomic_red"    = c("#09283C", "#CB1724", "#F2EBBB"),
         "atomic_blue"   = c("#09283C", "#3CC8C0", "#F2EBBB"),
         "atomic_orange" = c("#09283C", "#F18B00", "#F2EBBB"),


         stop('The palette must be one of the following: "venus", "earth", "mars", "jupiter", "ceres", "enceladus", "europa", "titan", "cancri", "hd",  "kepler186", "kepler 16b", "pegasi", "pso", "trappest", grand_tour", "atomic_clock", "atomic_red", "atomic_blue", or "atomic_orange'))
}



#' Display colors from one palette
#'
#' @description
#' This function displays a simple plot showing the colors and hexideciimal codes for one palette.
#'
#' @param palette A string with the name of a palette.
#'
#' @return A ggplot object.
#'
#' @details
#' Current options are "venus", "earth", "mars", "jupiter",
#' "ceres", "enceladus", "europa", "titan",
#' "cancri", "hd", "kepler186", "kepler 16b", "pegasi", "pso", "trappest",
#' grand_tour", "atomic_clock", "atomic_red", "atomic_blue", and "atomic_orange".
#'
#' @examples
#' show_palette("mars")
#'
show_palette <- function(palette) {
  n_colors <- length(pal)

  tibble(x = 1:n_colors, color = pal) %>%
    ggplot(aes(x, fill = color)) +
    geom_col(aes(y = 1), width = 1) +
    geom_text(aes(label = color), y = -0.04) +
    scale_fill_identity() +
    scale_x_continuous(expand = c(0, 0)) +
    scale_y_continuous(expand = expand_scale(c(0, 0), c(0.1, 0.01)))+
    labs(title = palette_string) +
    theme_void() +
    theme(legend.position = "none",
          plot.title = element_text(size = 20, face = "bold", hjust = 0.5),
          plot.margin = margin(0, 0, 0, 0, "in"))
}
