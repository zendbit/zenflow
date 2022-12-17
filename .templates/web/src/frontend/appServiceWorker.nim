import utils/ffi
import utils/cacheStorage
import assets
import utils/ajax

let appWorker = "appworker".cstring

self.toJs.addEventListener("install", proc (e: Event) =
  e.toJs.waitUntil(proc () {.async.} =
    let caches = await storageOpen(appWorker)
    caches.then(proc (cache: JsObject) =
      cache.addAll(assetsList)
    )
  )
)

self.toJs.addEventListener("fetch", proc (e: Event) =
  e.toJs.respondWith(proc () {.async.} =
    let caches = await storageMatch(e.toJs.request)
    caches.then(proc (res: JsObject): Future[JsObject] {.async.} =
      if res.isNil:
        result = fetch(e.toJs.request)

      else:
        result = res
    )
  )
)
