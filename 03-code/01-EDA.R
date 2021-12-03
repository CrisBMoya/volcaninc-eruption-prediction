library(data.table)
library(ggplot2)
library(tuneR)

train_list = list.files(path="D:/Documentos/raw-data/predict-volcanic-eruptions-ingv-oe/train", full.names=TRUE)
test_list = list.files(path="D:/Documentos/raw-data/predict-volcanic-eruptions-ingv-oe/test", full.names=TRUE)

train_metadata = fread(input="D:/Documentos/raw-data/predict-volcanic-eruptions-ingv-oe/train.csv")

train_csv = fread(file=paste0("D:/Documentos/raw-data/predict-volcanic-eruptions-ingv-oe/train/", train_metadata[1,]$segment_id, ".csv"), sep=",")


library(signal)
library(oce)


s1 = Wave(left=train_csv$sensor_1, samp.rate = 12000, bit = 16)
spec1 = specgram(x=s1@left, window=256, Fs=48000, overlap=as.integer(nrow(train_csv)/256 + 1))
spec1
