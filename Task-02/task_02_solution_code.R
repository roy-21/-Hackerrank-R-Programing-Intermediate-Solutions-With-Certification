find_most_potential_emirate <- function(df_data) {

  library(dplyr)

  # Fix column name inconsistency
  if ("Customer_names" %in% colnames(df_data)) {
    colnames(df_data)[colnames(df_data) == "Customer_names"] <- "Customer_name"
  }

  df_clean <- df_data %>%
    mutate(
      # Remove extra spaces in customer names
      Customer_name = trimws(Customer_name),

      # Clean Amount column (keep digits only)
      Amount = as.numeric(gsub("[^0-9]", "", Amount)),

      # Fix Purchase_date format and year
      Purchase_date = sapply(Purchase_date, function(x) {
        parts <- unlist(strsplit(x, "-"))

        # Convert mm-dd-yyyy to dd-mm-yyyy
        if (as.numeric(parts[2]) > 12) {
          parts <- c(parts[2], parts[1], parts[3])
        }

        # Fix incorrect years
        if (parts[3] %in% c("2027", "2037", "2047")) {
          parts[3] <- "2017"
        }

        paste(parts, collapse = "-")
      }),
      Purchase_date = as.Date(Purchase_date, format = "%d-%m-%Y")
    )

  # Customer-level revenue calculation
  customer_revenue <- df_clean %>%
    group_by(Emirates, Customer_name) %>%
    summarise(
      first_purchase = min(Purchase_date),
      total_revenue = sum(Amount),
      .groups = "drop"
    ) %>%
    mutate(
      total_days = as.numeric(as.Date("2017-12-31") - first_purchase) + 1,
      total_months = total_days / 30,
      ARPM = total_revenue / total_months,
      estimated_2018 = ARPM * 12
    )

  # Emirate-level aggregation
  result <- customer_revenue %>%
    group_by(Emirates) %>%
    summarise(
      Estimated_revenue = sum(estimated_2018),
      .groups = "drop"
    ) %>%
    arrange(desc(Estimated_revenue)) %>%
    slice(1:2) %>%
    mutate(
      Estimated_revenue = round(Estimated_revenue * 1.10)
    ) %>%
    rename(Emirate = Emirates)

  return(result)
}
