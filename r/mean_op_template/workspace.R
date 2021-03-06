library(tercen)
library(dplyr)
options("tercen.serviceUri" = "http://localhost:5402/api/v1")
options("tercen.username"= "admin")
options("tercen.password" = "admin")

options("tercen.workflowId"= "07d9dbf40e1cc21ca04f8b0baa005655")
options("tercen.stepId"= "5-4")


(ctx = tercenCtx())  %>% 
  select(.y, .ci, .ri) %>% 
  group_by(.ci, .ri) %>%
  summarise(mean = mean(.y)) %>%
  ctx$addNamespace() %>%
  ctx$save()
