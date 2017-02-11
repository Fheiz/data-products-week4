import pandas as pd
import os


df = pd.read_csv(os.path.join(os.getcwd(), 'beer_consumption.csv'))
df.columns = df.columns.str.strip()
df['Beverage Types'] = df['Beverage Types'].str.strip()

beverage_types = df['Beverage Types'].unique()
years = df.columns[3:]

all_countries = []
all_years = []
all_beverage_type = []
all_values = []

for _, row in df.iterrows():
    _country = row['Country']
    _beverage_type = row['Beverage Types']

    for _year in range(2000, 2016):
        _value = row[str(_year)]

        all_countries.append(_country)
        all_years.append(_year)
        all_beverage_type.append(_beverage_type)
        all_values.append(_value)

# Create a new data frame
new_df = pd.DataFrame.from_records({
    'Country': all_countries,
    'Year': all_years,
    'Beverage Types': all_beverage_type,
    'Values': all_values
})

# Change column order
new_df = new_df[['Country', 'Year', 'Beverage Types', 'Values']]
# Sort them
new_df = new_df.sort_values(['Country', 'Year'])

new_df.to_csv(os.path.join(os.getcwd(), 'better_beer_consumption.csv'), index=False)
