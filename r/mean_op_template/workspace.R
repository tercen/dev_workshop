library(tercen)
library(dplyr)
options("tercen.serviceUri" = "http://localhost:5402/api/v1")
options("tercen.username"= "admin")
options("tercen.password" = "admin")

options("tercen.workflowId"= "14d20c8ac2ebafaa447b4177d7062e48")
options("tercen.stepId"= "4-3")

(ctx = tercenCtx())  %>% 
  select(.y, .ci, .ri) %>% 
  group_by(.ci, .ri) %>%
  summarise(mean = mean(.y)) %>%
  ctx$addNamespace() %>%
  ctx$save()
