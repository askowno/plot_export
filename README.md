# plot_export

Testing plot and map export for booklet and webpages

-   When you make vector outputs like pdf and eps and svg (which is best for plots and simple maps as it allows G&E team to adjust elements and text etc) the font information needs to be embedded in the plot.

-   To do this one must use additional steps (not just ggsave). The package extrafont makes this possible with one or two lines of code.

-   For .eps and .svg simply add "device = cairo_ps" or "device = cairo_svg".

-   For pdf there is an extra step first make a special device "pdf" then use use "device = "pdf""

-   For complex raster based maps use png or tiff not svg, eps or pdf (standard ggsave works fine - just give output the correct .tiff or.png or .jpeg, and set dpi = 300)
