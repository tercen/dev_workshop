library(tercen)
library(dplyr)

options("tercen.serviceUri" = "http://localhost:5402/api/v1")
options("tercen.username"= "admin")
options("tercen.password" = "admin")

getOption("tercen.serviceUri")
getOption("tercen.username")
getOption("tercen.password")

options("tercen.workflowId"= "07d9dbf40e1cc21ca04f8b0baa005655")
options("tercen.stepId"= "5-4")

getOption("tercen.workflowId")
getOption("tercen.stepId")

ctx = tercenCtx()
ctx$names


(ctx = tercenCtx()) %>% select()
tercenCtx()$query
tercenCtx()$select()
tercenCtx()$rschema
tercenCtx()$cschema
tercenCtx()$workflow
tercenCtx()$workflow

rbenchmark::benchmark("workflow"= {
  tercenCtx()$workflow
}, 
"select"= {
  tercenCtx()$select()
}, 
replications = 1,
columns = c("test", "replications", "elapsed",
            "relative", "user.self", "sys.self"))


ctx %>% select()
ctx %>% cselect()
ctx = tercenCtx()

ctx

ctx$namespace
ctx$query
ctx$yAxis
ctx$xAxis
ctx$colors
ctx$labels
ctx$errors

ctx$op.value('scale')

# columns names of the xy table
ctx$names
# columns names of the column table
ctx$cnames
# columns names of the row table
ctx$rnames

# schema of the xy table
ctx$schema
# schema of the column table
ctx$cschema
# schema of the row table
ctx$rschema

# select xy table
ctx$select()
ctx$select(nr=1)
ctx$select(offset=10L, nr=3L)
ctx$select(c('.y','.ci','.ri'), nr=3)
ctx$select('.y', nr=3)

# select column table
ctx$cselect()
# select row table
ctx$rselect()

ctx %>% select()
ctx %>% cselect()
ctx %>% rselect()