'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "c29e72c8d0700de3d2dd67f69bda1077",
"version.json": "6ab195c08b3e8873fc9c397f7bc2f321",
"index.html": "9c58c94ac083a0f4573f6c90ba88277e",
"/": "9c58c94ac083a0f4573f6c90ba88277e",
"main.dart.js": "59f0a7d7f86954dbbffb631f5a3aca7d",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"favicon.png": "22402ad6b44e99dcc8e3859648525755",
"icons/Icon-192.png": "7cedc088e01ba3d3aafdd1d59c4a817b",
"icons/Icon-maskable-192.png": "7cedc088e01ba3d3aafdd1d59c4a817b",
"icons/Icon-maskable-512.png": "1ecd35309d42d46a95f4f8503a187806",
"icons/Icon-512.png": "1ecd35309d42d46a95f4f8503a187806",
"manifest.json": "8278e8ed139071f6a4d58c76b47dcdd3",
"assets/AssetManifest.json": "e6787ca39e151dd14e2bc0a7b19f82cf",
"assets/NOTICES": "9c1f04e2107b0948b995ffb9379c7129",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "ac2bd0736b24176745016d76415572e7",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "0c8e75fc3a9ba3f13a2b2b4c1f7bbdbb",
"assets/fonts/MaterialIcons-Regular.otf": "0db35ae7a415370b89e807027510caf0",
"assets/assets/images/result6_mobile.png": "57b24215ca3ecefe9ebb1f3bd165708e",
"assets/assets/images/result7_web.png": "5176d0a16a130404128f4c2cd5f59ed2",
"assets/assets/images/result6_web.png": "692c27f8e53f38b57e732adcbb85a3ee",
"assets/assets/images/result3_mobile.png": "f6988831a05c162147af42f2d626c0a3",
"assets/assets/images/background_mobile.png": "7fa5a6b08eb09dcb11abd66b47ee59bf",
"assets/assets/images/result4_web.png": "5c802a8a78bf21c212440b10c763d413",
"assets/assets/images/result4_mobile.png": "5d78f54ca687280c6d20dee5c1d01c31",
"assets/assets/images/result1_mobile.png": "7bbd227460b21d3eae23a5206d83fb88",
"assets/assets/images/result5_web.png": "7dfa15c43c01c889380386d29055a387",
"assets/assets/images/question_card.svg": "e9f78890c51a8c5b51595e764fd7b3db",
"assets/assets/images/homepage_words.png": "e0e27c162c613ace894e0032f9606ce9",
"assets/assets/images/result2_mobile.png": "5ad359582b776f88e0cb5d36a15d117b",
"assets/assets/images/logo.png": "47356b5a63f1d2076ba675a802e7f29c",
"assets/assets/images/star.svg": "ad488cb00c4e3941470b481473edc4cc",
"assets/assets/images/result1_web.png": "ae69ff93696c8726763e9d56c4aaa01c",
"assets/assets/images/result7_mobile.png": "f086196520b16972584e011e02a31f65",
"assets/assets/images/result3_web.png": "35022d44d8a5d54992bf4407eac08ae6",
"assets/assets/images/background_web.png": "2336d498ed1a0b3911ed20ae0c6122f6",
"assets/assets/images/result2_web.png": "c5328da3631c0e6ab8b54ac82740724f",
"assets/assets/images/result5_mobile.png": "0e1d937a72b8cafb4ce78294462a0e2a",
"assets/assets/icons/favicon.png": "5e2bc53c256750b9056cd4a106be632b",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
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
