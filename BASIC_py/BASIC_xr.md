# Xarray

# Import nc data.
Function for Import nc data
```
import xarray as xr
def extract_nc_info(nc_path, stn, unit, yrST=None, yrEN=None):
    #
    nc_data = xr.open_dataset(nc_path, engine='netcdf4')
    #
    time = nc_data['years'].values
    idx = index_year_range(yrST, yrEN, time)
    time = time[idx]
    #
    UNIT_CONVERSION = {'m': 1000, 'cm': 10, 'mm': 1}
    slc = nc_data['sea_level_change'].values[:, idx, stn] / UNIT_CONVERSION[unit]
    #
    lat = np.around(nc_data['lat'][stn].values, decimals=2)
    lon = np.around(nc_data['lon'][stn].values, decimals=2)
    #
    return nc_data, slc, time, lat, lon
# ^^^^^^^^^^^^^^^^^^^^^^^^^^^
}
```

### Open *.nc file 
```
path2file=f'.nc'
nc_data = xr.open_dataset(path2file, engine='netcdf4')
```
- **NOTE** if the time axis is not formatted use instead
```
nc_data = xr.open_dataset(path2file, engine='netcdf4', decode_times=False)
print(nc_data['time'])
```