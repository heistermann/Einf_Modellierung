# Produce daily and monthly csv files from MOPEX's weird fixed-width format

rm(list = ls())

# SETTINGS
#   Gauge IDs
ids = c("02296750", "02329000", "02375500", "02236000", "02365500")
#   Write daily files, too?
write_daily=FALSE
#   in directory
indir = "E:/src/git/heistermann/Einf_Modellierung/Termin_3/data/mopex/Us_438_Daily/"
outdir = "E:/src/git/heistermann/Einf_Modellierung/Termin_4/data/"

for (id in ids) {

# Read meta data
meta = read.fwf(file=paste(indir,"/../usgs431.txt", sep=""),
                widths=c(9, 10, 12, 11, 8, 8, 7, 4, 4, 3, 10, 48), 
                stringsAsFactors=FALSE)
names(meta) = c("id", "lon", "lat", "area1", "area2", 
                "start", "end", "nn1", "nn2", "statecode", "nn3", "name")

gauge_name = meta$name[meta$id==as.numeric(id)]
basin_size = meta$area1[meta$id==as.numeric(id)]
gauge_lon = meta$lon[meta$id==as.numeric(id)]
gauge_lat = meta$lat[meta$id==as.numeric(id)]


# Read fixed width data file
fname = paste(indir, id, ".dly", sep="")
data = read.fwf(file=fname, widths=c(4, 2, 2, 10, 10, 10, 10, 10), 
                stringsAsFactors=FALSE)
names(data) = c("year", "month", "day", "precip", 
                "pet", "discharge", "maxt", "mint")
data[data==-99.] = NA
data$discharge[data$discharge<0] = NA

# Create a regular date and a fake date that ignores days (always first of month)
data$date = strftime(as.Date(paste(data$year, data$month, data$day, sep = "-" ), 
                            format="%Y-%m-%d"), format="%Y-%m-%d")
fakedate = strftime(as.Date(data$date), format="%Y-%m-01")

# monthly aggregation
sums = aggregate(data[,c("precip", "pet", "discharge")], 
                   by=list("date"=fakedate), FUN="sum")
avgs = aggregate(data[,c("mint", "maxt")], 
                 by=list("date"=fakedate), FUN="mean")

monthly = merge(sums, avgs, by="date")

# Daily data frame
daily = data[,c("date","precip","pet","discharge","mint","maxt")]

header = paste(
"# ID: ", id, "\n",
"# Name: ", gauge_name, "\n",
"# Drainage area (km2): ", basin_size*1.609^2, "\n",
"# Longitude: ", gauge_lon, "\n",
"# Latitude: ", gauge_lat, "\n\n", 
"# The original data has been downloaded from ftp://hydrology.nws.noaa.gov/pub/gcip/mopex/US_Data/.
# The data has been reformatted, monthly files have been created through aggregation.
#
# Please beware that the values for precipitation, PET and discharge
# are provided in mm. This depth refers to a daily time step for the
# daily files, and a monthly time step for the monthly files.
#
# The columns have the following meaning:
# date: date in YYYY-MM-DD\n
# precip: mean areal precipitation depth for the basin (in mm)
# pet: mean areal potential evaporation depth (in mm)
# discharge: discharge observed at the stream flow gauge (in mm)
# mint: daily minimum temperature (monthly file: average minimum daily temperature) (in degC)
# maxt: daily maximum temperature (monthly file: average minimum daily temperature) (in degC)", sep="")

options(warn=1)
if (write_daily) {
  fname = paste(outdir, id, ".daily", sep="")
  write(header, file=fname)
  write.table(daily, file=fname, sep=";", append=TRUE, quote=FALSE, row.names=FALSE)
}
fname = paste(outdir, id, ".monthly", sep="")
write(header, file=fname)
write.table(monthly, file=fname, sep=";", append=TRUE, quote=FALSE, row.names=FALSE)
options(warn=2)
}