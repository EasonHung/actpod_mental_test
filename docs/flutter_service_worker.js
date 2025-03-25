'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "5423b7b68cce367f38934af405025da8",
"version.json": "6ab195c08b3e8873fc9c397f7bc2f321",
"index.html": "9c58c94ac083a0f4573f6c90ba88277e",
"/": "9c58c94ac083a0f4573f6c90ba88277e",
"main.dart.js": "c8906935b129b51470c9e3c94abf19f1",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"favicon.png": "22402ad6b44e99dcc8e3859648525755",
"icons/Icon-192.png": "7cedc088e01ba3d3aafdd1d59c4a817b",
"icons/Icon-maskable-192.png": "7cedc088e01ba3d3aafdd1d59c4a817b",
"icons/Icon-maskable-512.png": "1ecd35309d42d46a95f4f8503a187806",
"icons/Icon-512.png": "1ecd35309d42d46a95f4f8503a187806",
"manifest.json": "8278e8ed139071f6a4d58c76b47dcdd3",
"assets/AssetManifest.json": "e6787ca39e151dd14e2bc0a7b19f82cf",
"assets/NOTICES": "b96ec02cf8dd0039084943f0de259647",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "ac2bd0736b24176745016d76415572e7",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "0c8e75fc3a9ba3f13a2b2b4c1f7bbdbb",
"assets/fonts/MaterialIcons-Regular.otf": "0db35ae7a415370b89e807027510caf0",
"assets/assets/images/result6_mobile.png": "4b34406542e080d720d5a9ef6cf24e07",
"assets/assets/images/result7_web.png": "e6e40f03e246172a4daa8fcf9e465380",
"assets/assets/images/result6_web.png": "0a2b2ec41e0a7c23418bf7a2dd9dc61b",
"assets/assets/images/result3_mobile.png": "d51505125500c713805f55f8513b6f91",
"assets/assets/images/background_mobile.png": "7fa5a6b08eb09dcb11abd66b47ee59bf",
"assets/assets/images/result4_web.png": "0d416e75a157542a6acb01353f016bd4",
"assets/assets/images/result4_mobile.png": "7d8bea0c243d81b09b1413e13bad2961",
"assets/assets/images/result1_mobile.png": "123a6d271714ff8c6b904fe0efe96786",
"assets/assets/images/result5_web.png": "37c290a20a6927106c9a2c9ddadda7bd",
"assets/assets/images/question_card.svg": "e9f78890c51a8c5b51595e764fd7b3db",
"assets/assets/images/homepage_words.png": "e0e27c162c613ace894e0032f9606ce9",
"assets/assets/images/result2_mobile.png": "e4d32bc29d111dd377176f05f9c6cc77",
"assets/assets/images/logo.png": "47356b5a63f1d2076ba675a802e7f29c",
"assets/assets/images/star.svg": "ad488cb00c4e3941470b481473edc4cc",
"assets/assets/images/result1_web.png": "840640d923926ce1ec6f989f2126ee1f",
"assets/assets/images/result7_mobile.png": "d934cf589864a252348f80ff9a2ad30c",
"assets/assets/images/result3_web.png": "286b0e93d98730959641cab00ac8bc2d",
"assets/assets/images/background_web.png": "2336d498ed1a0b3911ed20ae0c6122f6",
"assets/assets/images/result2_web.png": "25f7b96b8cc44eb2342137070d22df9c",
"assets/assets/images/result5_mobile.png": "3990cb01db1262161fae520693eecda5",
"assets/assets/icons/favicon.png": "5e2bc53c256750b9056cd4a106be632b",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
