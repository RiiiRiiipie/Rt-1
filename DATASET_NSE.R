#for nifty 50
library(quantmod)
getSymbols("^NSEI", src = "yahoo", from = "2010-01-01", to = "2022-05-30")
NIFTY_weekly = to.weekly(`NSEI`)
NIFTY_weekly_omited = na.omit(NIFTY_weekly)
NIFTY_close = diff(log(NIFTY_weekly_omited$`NSEI.Close`))
dataset_NIFTY = as.numeric(NIFTY_close)
summary(dataset_NIFTY)
dataset_NIFTY = na.omit(dataset_NIFTY)
dataset_NIFTY

#for nifty auto1
getSymbols("^CNXAUTO", src = "yahoo", from = "2010-01-01", to = "2022-05-30")
AUTO_weekly = to.weekly(`CNXAUTO`)
AUTO_weekly_omited = na.omit(AUTO_weekly)
AUTO_close = diff(log(AUTO_weekly_omited$`CNXAUTO.Close`))
dataset_AUTO = as.numeric(AUTO_close)
summary(dataset_AUTO)
dataset_AUTO = na.omit(dataset_AUTO)
dataset_AUTO

#FOR NIFTY BANK2
getSymbols("^NSEBANK", src = "yahoo", from = "2010-01-01", to = "2022-05-30")
BANK_weekly = to.weekly(`NSEBANK`)
BANK_weekly_omited = na.omit(BANK_weekly)
BANK_close = diff(log(BANK_weekly_omited$`NSEBANK.Close`))
dataset_BANK = as.numeric(BANK_close)
summary(dataset_BANK)
dataset_BANK = na.omit(dataset_BANK)
dataset_BANK

#FOR NIFTY COMMODITIES3
getSymbols("^CNXCMDT", src = "yahoo", from = "2010-01-01", to = "2022-05-30")
COMMODITIES_weekly = to.weekly(`CNXCMDT`)
COMMODITIES_weekly_omited = na.omit(COMMODITIES_weekly)
COMMODITIES_close = diff(log(COMMODITIES_weekly_omited$`CNXCMDT.Close`))
dataset_COMMODITIES = as.numeric(COMMODITIES_close)
summary(dataset_COMMODITIES)
dataset_COMMODITIES = na.omit(dataset_COMMODITIES)
dataset_COMMODITIES

#FOR NIFTY ENERGY4
getSymbols("^CNXENERGY", src = "yahoo", from = "2010-01-01", to = "2022-05-30")
ENERGY_weekly = to.weekly(`CNXENERGY`)
ENERGY_weekly_omited = na.omit(ENERGY_weekly)
ENERGY_close = diff(log(ENERGY_weekly_omited$`CNXENERGY.Close`))
dataset_ENERGY = as.numeric(ENERGY_close)
summary(dataset_ENERGY)
dataset_ENERGY = na.omit(dataset_ENERGY)
dataset_ENERGY

#FOR NIFTY FMCG5
getSymbols("^CNXFMCG", src = "yahoo", from = "2010-01-01", to = "2022-05-30")
FMCG_weekly = to.weekly(`CNXFMCG`)
FMCG_weekly_omited = na.omit(FMCG_weekly)
FMCG_close = diff(log(FMCG_weekly_omited$`CNXFMCG.Close`))
dataset_FMCG = as.numeric(FMCG_close)
summary(dataset_FMCG)
dataset_FMCG = na.omit(dataset_FMCG)
dataset_FMCG

#FOR NIFTY IT7
getSymbols("^CNXIT", src = "yahoo", from = "2010-01-01", to = "2022-05-30")
IT_weekly = to.weekly(`CNXIT`)
IT_weekly_omited = na.omit(IT_weekly)
IT_close = diff(log(IT_weekly_omited$`CNXIT.Close`))
dataset_IT = as.numeric(IT_close)
summary(dataset_IT)
dataset_IT = na.omit(dataset_IT)
dataset_IT

#FOR NIFTY INFRA8
getSymbols("^CNXINFRA", src = "yahoo", from = "2010-01-01", to = "2022-05-30")
INFRA_weekly = to.weekly(`CNXINFRA`)
INFRA_weekly_omited = na.omit(INFRA_weekly)
INFRA_close = diff(log(INFRA_weekly_omited$`CNXINFRA.Close`))
dataset_INFRA = as.numeric(INFRA_close)
summary(dataset_INFRA)
dataset_INFRA = na.omit(dataset_INFRA)
dataset_INFRA

#FOR NIFTY METALS9
getSymbols("^CNXMETAL", src = "yahoo", from = "2010-01-01", to = "2022-05-30")
METALS_weekly = to.weekly(`CNXMETAL`)
METALS_weekly_omited = na.omit(METALS_weekly)
METALS_close = diff(log(METALS_weekly_omited$`CNXMETAL.Close`))
dataset_METALS = as.numeric(METALS_close)
summary(dataset_METALS)
dataset_METALS = na.omit(dataset_METALS)
dataset_METALS

#FOR NIFTY REALTY10
getSymbols("^CNXREALTY", src = "yahoo", from = "2010-01-01", to = "2022-05-30")
REALTY_weekly = to.weekly(`CNXREALTY`)
REALTY_weekly_omited = na.omit(REALTY_weekly)
REALTY_close = diff(log(REALTY_weekly_omited$`CNXREALTY.Close`))
dataset_REALTY = as.numeric(REALTY_close)
summary(dataset_REALTY)
dataset_REALTY = na.omit(dataset_REALTY)
dataset_REALTY



