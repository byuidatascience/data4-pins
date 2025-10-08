# https://www.ssa.gov/oact/babynames/limits.html
# Download and unzip to same folder as this script
# AK,F,1911,Ruth,7
# %%
import polars as pl
from pins import board_connect
from dotenv import load_dotenv, find_dotenv
# from posit import connect

load_dotenv("../../../.env")
API_KEY = os.getenv('CONNECT_API_KEY')
SERVER = os.getenv('CONNECT_SERVER')


# %%
dat = pl.read_csv(
  'namesbystate/*.TXT',
  has_header=False,
  new_columns = ['state', 'gender', 'year', 'name', 'count'])\
  .group_by('state', 'name', 'year')\
  .agg(pl.sum('count').alias('count'))\
  .sort('state')

dat_total = dat.group_by('name', 'year').agg(pl.sum('count').alias('Total'))
# %%
# Now pivot
out_dat = dat.pivot('state', index=['name', 'year'], values='count')\
  .fill_null(0)\
  .join(dat_total, on=['name', 'year'])\
  .sort('name', 'year')


# %%
# Publish the data to the server with Bro. Hathaway as the owner.
pin_name = "names_year"
board = board_connect(server_url=SERVER, api_key=API_KEY)
board.pin_write(out_dat.to_pandas(), "hathawayj/" + pin_name, type="parquet")

# %%
meta = board.pin_meta("hathawayj/" + pin_name)
# https://docs.posit.co/connect/user/python-pins/
# https://rstudio.github.io/pins-python/
meta.local.get("content_id")



#%% Need to set the vanity url
# Do by hand https://posit.byui.edu/connect/#/apps/c0c197d3-f6bc-4129-9df4-4683c1f25e61/access
# Soon there will be code.
# https://github.com/posit-dev/posit-sdk-py/issues/175
# https://posit-dev.github.io/posit-sdk-py/quickstart.html