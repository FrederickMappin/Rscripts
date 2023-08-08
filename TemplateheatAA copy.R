
library("ggplot2")
library("ComplexHeatmap")
library("circlize")
library("ggplotify")
library("grid")

#https://jokergoo.github.io/ComplexHeatmap/reference/Heatmap.html
#https://jokergoo.github.io/ComplexHeatmap-reference/book/introduction.html
#https://cran.r-project.org/web/packages/ggplotify/ggplotify.pdf


#################MAKE AMINOACID MATRIX############


#Decide on a color scheme
col_fun = colorRamp2(c(0, 50,99,100), c("sky blue", "white", "red", "black"))
col_fun(seq(0,100))



lgd_list <- list(title = "ID %", legend_height = unit(10, "cm"), grid_width = unit(1, "cm"), at = c(0, 20, 40,60,80, 100))

plot <- Heatmap(ID_phyl,
          col = col_fun, heatmap_legend_param = lgd_list,

        #Dimenson of chart
        width = unit(20, "cm"), height = unit(20, "cm"),
                                            
        #Dendrograms      
        row_dend_side = "left",
        column_dend_side = "top",
        column_dend_height = unit(1, "cm"), 
        row_dend_width = unit(1, "cm"),
       
        #row labels
        row_names_side = "left",
        column_names_side = "top",
        row_names_gp = gpar(fontsize = 5, fontfamily="Arial"),
        column_names_gp = gpar(fontsize = 5, fontfamily = "Arial"),
        column_names_rot = 90,
        row_names_rot = 0,
        
       #clustering
        cluster_rows = FALSE,
        cluster_columns = FALSE)


p <- as.ggplot(plot)
p

ggsave("/Users/FreddyMappin/Desktop/pairwiseAA_phy.png", width = 38, height = 38, units = "cm", dpi=300)

#################MAKE Protein ##########


#Decide on a color scheme
col_fun = colorRamp2(c(0, 50,99,100), c("sky blue", "white", "red", "black"))
col_fun(seq(0,100))



lgd_list <- list(title = "LGA_S", legend_height = unit(10, "cm"), grid_width = unit(1, "cm"), at = c(0, 20, 40,60,80, 100))

plot <- Heatmap(LGA_S_phy,
                col = col_fun, heatmap_legend_param = lgd_list,
                
                #Dimenson of chart
                width = unit(20, "cm"), height = unit(20, "cm"),
                
                #Dendrograms      
                row_dend_side = "left",
                column_dend_side = "top",
                column_dend_height = unit(1, "cm"), 
                row_dend_width = unit(1, "cm"),
                
                #row labels
                row_names_side = "left",
                column_names_side = "top",
                row_names_gp = gpar(fontsize = 5, fontfamily="Arial"),
                column_names_gp = gpar(fontsize = 5, fontfamily = "Arial"),
                column_names_rot = 90,
                row_names_rot = 0,
                
                #clustering
                cluster_rows = FALSE,
                cluster_columns = FALSE)


p <- as.ggplot(plot)
p

ggsave("/Users/FreddyMappin/Desktop/LGA_S_phy.png", width = 38, height = 38, units = "cm", dpi=300)


