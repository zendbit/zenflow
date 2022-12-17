##
##  zfcore web framework for nim language
##  This framework if free to use and to modify
##  License: BSD
##  Author: Amru Rosyada
##  Email: amru.rosyada@gmail.com
##  Git: https://github.com/zendbit
##

## import zfcore
import zfcore/server
#import example
import index

routes:
  staticDir "/"

  after:
    response.headers["Access-Control-Allow-Origin"] = "http://localhost:9001"
    response.headers["Access-Control-Allow-Credentials"] = "true"

emitServer()
