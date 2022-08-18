{.used.}
import zfcore/server
import zfplugs/layout

var page {.threadvar.}: Layout

routes:
  before:
    page = newLayoutFromFile("home.mustache")

  # accept request with /example/123456
  # id will capture the value 12345
  get "/index/<id>":
    page.c["user"] = params.getOrDefault("id")
    Http200.respHtml(page.render())
