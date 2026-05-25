# %%
import polars as pl

# %%
pl.read_parquet('https://posit.byui.edu/data/buildings0809/buildings0809.parquet')
pl.read_parquet('https://posit.byui.edu/data/restaurants/restaurants.parquet')
pl.read_parquet('https://posit.byui.edu/data/permits/permits.parquet')
pl.read_parquet('https://posit.byui.edu/data/climate_zone_fips/climate_zone_fips.parquet')

# %%
