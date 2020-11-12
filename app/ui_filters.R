
ui_filtersidebar <- function(){
  
  column(width = 3,
    ui_filtersidebar_plotselection(),
    ui_filtersidebar_plotheight(),
    hr(),
    tags$label(tags = "control-label", "Filters"),
    tags$br(),
    
    # Filters
    ui_filter_iteration_range(),
    ui_filter_single_iterations(),
    ui_filter_technology(),
    ui_filter_producer(),
    ui_filter_cashflow(),
    ui_filter_fuel(),
    ui_filter_segment(),
    # ui_filter_tick_expected(),
    # ui_filter_tick()
  )
  
}

# Standard filters ----------------------------------------------------------

ui_filter_iteration_range <- function(){
  
  conditionalPanel(
    condition = "output.hide_filter_iteration_range == false",
    
    box(title = "Iterations", width = 12, solidHeader = TRUE, 
        collapsible = TRUE, collapsed = TRUE,
        checkboxInput("iteration_average", "Show average", TRUE),
        sliderInput(
          "iterations",
          label = "Range",
          min = iteration_min, max = iteration_max,
          value = c(iteration_min, iteration_max))
    )
  )
  
}

ui_filter_single_iterations <- function(){
  
  conditionalPanel(
    condition = "output.show_filter_single_iteration == true",
    
    box(title = "Single Iteration", width = 12, solidHeader = TRUE, 
        collapsible = TRUE, collapsed = TRUE,
        sliderInput(
          "single_iteration", # TODO need to adjust iterations processing if sinlge value back.
          label = "Iteration",
          min = iteration_min, max = iteration_max,
          value = c(iteration_min))
    )
  )
}

ui_filter_technology <- function(){
  conditionalPanel(
    condition = "output.show_filter_technology == true",
    box(title = "Filter by Technologies", width = 12, collapsible = TRUE, collapsed = TRUE, solidHeader = FALSE,
        checkboxGroupInput("technologies_checked", label = "",
                           choices = all_technologies,
                           selected = selected_technologies))
  )
  
}

ui_filter_producer <- function(){
  conditionalPanel(
    condition = "output.show_filter_producer == true",
    box(title = "Filter by Producers", width = 12, collapsible = TRUE, collapsed = TRUE, solidHeader = FALSE,
        checkboxGroupInput("producers_checked", label = "",
                           choices = all_producers,
                           selected = selected_producers))
  )
}  


ui_filter_cashflow <- function(){
  conditionalPanel(
    condition = "output.show_filter_cashflow == true",
    box(title = "Filter by Cashflow", width = 12, collapsible = TRUE, collapsed = TRUE, solidHeader = FALSE,
        checkboxGroupInput("cashflows_checked", label = "",
                           choices = all_cashflows,
                           selected = selected_cashflows))
  )
}  

ui_filter_fuel <- function(){
  conditionalPanel(
    condition = "output.show_filter_fuel == true",
    box(title = "Filter by Fuels", width = 12, collapsible = TRUE, collapsed = TRUE, solidHeader = FALSE,
        checkboxGroupInput("fuels_checked", label = "",
                           choices = all_fuels,
                           selected = selected_fuels))
  )
}  

ui_filter_segment <- function(){
  conditionalPanel(
    condition = "output.show_filter_segment == true",
    box(title = "Filter by Segment", width = 12, collapsible = TRUE, collapsed = TRUE, solidHeader = FALSE,
        
        checkboxInput(
          inputId = "all_in_one_plot",
          label = "Segments in one plot",
          value = TRUE),
        checkboxInput(
          inputId = "flip_tick_segment",
          label = "Flip tick and segment",
          value = TRUE),
        checkboxGroupInput("segments_checked", label = "",
                           choices = all_segments,
                           selected = selected_segments))
  )
}  

ui_filter_tick_expected <- function(){
  conditionalPanel(
    condition = "output.show_filter_tick_expected == true",
    box(title = "Tick for Expectations", width = 12, collapsible = TRUE, collapsed = TRUE, solidHeader = FALSE,
        sliderInput(
          "tick_expected",
          label = "Tick",
          min = tick_expected_min, max = tick_expected_max,
          value = c(tick_expected_min, tick_expected_max))
    ))
}  

ui_filter_tick <- function(){
  
  conditionalPanel(
    #condition = "output.show_filter_tick == true",
    box(title = "Tick", width = 12, collapsible = TRUE, collapsed = TRUE, solidHeader = FALSE,
        sliderInput(
          "tick_checked",
          label = "Tick",
          min = tick_min, max = tick_max,
          value = tick_min)))
}

# Plot related controls ---------------------------------------------------

ui_filtersidebar_plotselection <- function(){
  
  selectInput(
    inputId = "single_plot_selected", 
    label = "Choose the plot to display", 
    choices = single_plot_select_names(names(plots))
  )
  
}

ui_filtersidebar_plotheight <- function(){
  sliderInput(
    "selected_single_plot_height",
    label = "Plot height",
    min = 200, max = 5000, step = 100,
    value = 500)
}



