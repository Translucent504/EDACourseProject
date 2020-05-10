NEI <- readRDS("data/summarySCC_PM25.rds")
NEI$year <- as.Date(as.character(NEI$year), "%Y")
SCC <- readRDS("data/Source_Classification_Code.rds")
baltimore <- subset(NEI, fips=="24510")
balt_veh <- merge(baltimore, SCC)
balt_veh <- balt_veh[grep("Veh", balt_veh$Short.Name),]
balt_veh <- aggregate(data=balt_veh, Emissions ~ year+ fips, sum)
ggplot(data=balt_veh) + aes(x=year, y=Emissions) + geom_point()
ggsave("plot5.png")