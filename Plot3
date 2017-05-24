
## Calculating the total emission in Baltimore by year and type:
>tot_Baltimore_type<- with(Baltimore_emi, tapply(Emission, list(type, year), sum))
>tot_Baltimore_type
            1999      2002      2005       2008
NON-ROAD  522.940  240.8469  248.9337   55.82356
NONPOINT 2107.625 1509.5000 1509.5000 1373.20731
ON-ROAD   346.820  134.3088  130.4304   88.27546
POINT     296.795  569.2600 1202.4900  344.97518

> temp<- as.vector(tot_Baltimore_type)
> temp_year<- rep(years,each=4)
> temp_type<- rep(rownames(tot_Baltimore_type), times=4)
> total_type_Bal <- data.frame(total.emissions = temp,year=temp_year,type=temp_type)
> ggplot(total_type_Bal,aes(y=total.emissions,x=year)) + geom_line() + facet_grid (type~.) + theme_bw()+ylab("Total Emissions") 

# From the data and the plot it can be seen that the emission type “Point” has increases during 1999 to 2008. The other three types all decreases.
