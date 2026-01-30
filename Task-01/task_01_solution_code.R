calculate_competitive_index <- function(df_data) {

  library(dplyr)

  result <- df_data %>%
    
    # 1. Keep only approved loan applications
    filter(Action_taken == 1) %>%
    
    # 2. Calculate total loan amount per bank per year per country
    group_by(Year, Country, Inst_id) %>%
    summarise(
      Loan_amt_bank = sum(Loan_amount),
      .groups = "drop"
    ) %>%
    
    # 3. Calculate total loan amount per country per year
    group_by(Year, Country) %>%
    mutate(
      Loan_amt_country = sum(Loan_amt_bank)
    ) %>%
    
    # 4. Calculate squared market share for each bank
    mutate(
      market_share_sq = (Loan_amt_bank / Loan_amt_country)^2
    ) %>%
    
    # 5. Calculate competitive index per country per year
    summarise(
      Competitive_index = sum(market_share_sq),
      .groups = "drop"
    ) %>%
    
    # 6. Sort by Year and Country
    arrange(Year, Country) %>%
    
    # 7. Round Competitive Index to 3 decimals
    mutate(
      Competitive_index = round(Competitive_index, 3)
    )

  return(result)
}
