library(tercen)

options("tercen.serviceUri" = "http://localhost:5402/api/v1")
options("tercen.username"= "admin")
options("tercen.password" = "admin")
client = TercenClient$new()

client
client$session
teamId = client$session$user$teamAcl$aces[[1]]$principals[[1]]$principalId
date = '2019'

projects = client$documentService$findProjectByOwnersAndCreatedDate(startKey=list(teamId,date),endKey=list(teamId,''))
projects
project = projects[[1]]



fileDoc = FileDocument$new()
fileDoc$name = 'iris from R'
fileDoc$projectId = project$id
fileDoc$acl$owner = project$acl$owner
fileDoc$metadata = CSVFileMetadata$new()
fileDoc$metadata$contentType = 'text/csv'
fileDoc$metadata$separator = ','
fileDoc$metadata$quote = '"'
fileDoc$metadata$contentEncoding = 'iso-8859-1'
fileDoc

data = iris
data['observation'] = 1:dim(data)[1]
con = rawConnection(raw(0), "r+")
write.csv(data, file=con, row.names = F)
bytes = rawConnectionValue(con)

fileDoc = client$fileService$upload(fileDoc, bytes)

fileDoc

task = CSVTask$new()
task$fileDocumentId = fileDoc$id

task = client$taskService$create(task)
task = client$taskService$waitDone(task$id)