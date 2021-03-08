# Deliverable 1
library(dplyr) #import the dplyr library
mecha_table <- read.csv(file='MechaCar_mpg.csv',check.names = F,stringsAsFactors = F) #import the mpg dataset
lm(mpg ~ AWD + ground_clearance + spoiler_angle + vehicle_weight + vehicle_length,data=mecha_table) #generate multiple linear regression model
summary(lm(mpg ~ AWD + ground_clearance + spoiler_angle + vehicle_weight + vehicle_length,data=mecha_table)) #generate summary statistics

# Deliverable 2
suspension_table <- read.csv(file='Suspension_Coil.csv', check.names = F,stringsAsFactors = F) #import the suspension coils dataset
total_summary <- suspension_table %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep') #create summary table based on the PSI column
lot_summary <- suspension_table %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep') #create summary table for PSI grouped by lot number

# Deliverable 3
t.test((suspension_table$PSI),mu=1500) #compare all manufacturing lots to the population mean
t.test(subset(suspension_table, Manufacturing_Lot == "Lot1")$PSI, mu=1500) #compare the psi values from lot1 to the population mean
t.test(subset(suspension_table, Manufacturing_Lot == "Lot2")$PSI, mu=1500) #compare the psi values from lot2 to the population mean
t.test(subset(suspension_table, Manufacturing_Lot == "Lot3")$PSI, mu=1500) #compare the psi values from lot3 to the population mean
