library("ggplot2")
library("ComplexHeatmap")
library("circlize")
library("ggplotify")
library("grid")

#https://jokergoo.github.io/ComplexHeatmap/reference/Heatmap.html
#https://jokergoo.github.io/ComplexHeatmap-reference/book/introduction.html
#https://cran.r-project.org/web/packages/ggplotify/ggplotify.pdf



#Decide on a color scheme
col_fun = colorRamp2(c(0, 70,99,100), c("sky blue", "white", "red", "black"))
col_fun(seq(0,100))


lgd_list <- list(title = "LGA_S", legend_height = unit(10, "cm"), at = c(0, 20, 40,60,80, 100))


plot <- Heatmap(indolecluster,
          col = col_fun, heatmap_legend_param = lgd_list,

        #Dimenson of chart
        width = unit(20, "cm"), height = unit(20, "cm"),
                                            
        #Dendrograms      
        row_dend_side = "left",
        column_dend_side = "top",
        column_dend_height = unit(2, "cm"), 
        row_dend_width = unit(2, "cm"),
       
        #row labels
        row_names_side = "left",
        column_names_side = "top",
        row_names_gp = gpar(fontsize = 5),
        column_names_gp = gpar(fontsize = 5),
        column_names_rot = 90,
        row_names_rot = 0,
        
       #clustering
        clustering_distance_rows = "maximum",
        clustering_method_rows = "average",
        clustering_distance_columns = "maximum",
        clustering_method_columns = "average")


p <- as.ggplot(plot)
p

ggsave("/Users/FreddyMappin/Desktop/indole.png", width = 25, height = 25, units = "cm", dpi=300)


