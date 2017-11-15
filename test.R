install.packages("SparkR")
Sys.setenv(SPARK_HOME = "C:/Users/Kent_Tung/Desktop/spark-2.1.0-bin-hadoop2.7/spark-2.1.0-bin-hadoop2.7")
library(SparkR, lib.loc = c(file.path(Sys.getenv("SPARK_HOME"), "R", "lib"))) 
library(SparkR)
sc = sparkR.init();sqlContext = sparkRSQL.init(sc)

newiris = iris;
names(newiris) = c("Sepal_Length","Sepal_Width","Petal_Length","Petal_Width","Species")
df = createDataFrame(sqlContext, newiris)
printSchema(df)
head(select(df, df$Sepal_Length)) 
head(select(df, df$Sepal_Length),10)
head(filter(df, df$Sepal_Length > 5.4))
sepal_counts = summarize(groupBy(df, df$Sepal_Length), count = n(df$Sepal_Length))
sparkR.session.stop()

print("this is a test")