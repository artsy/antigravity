const express = require("express")
const fabricate = require("./fabricate")
const fabricate2 = require("./fabricate2")
const GRAVITY_URL = process.env.ARTSY_URL || "http://localhost:5000/__gravity"

/*
 * Fake gravity express app
 */
const gravity = (module.exports = express())

gravity.get("/api/v1/artwork/:id", (req, res) =>
  res.send(fabricate("artwork", { title: "Main artwork!" }))
)

gravity.get("/api/v1/post/:id", (req, res) =>
  res.send(fabricate("post", { title: "Main post!" }))
)

gravity.get("/api/v1/shortcut/:id", (req, res) =>
  res.send(fabricate("shortcut"))
)

gravity.get("/api/v1/related/posts", (req, res) =>
  res.send([fabricate("post", { title: "Related post!" }), fabricate("post")])
)

gravity.get("/api/v1/related/layer/synthetic/main/artworks", (req, res) =>
  res.send([
    fabricate("artwork", { title: "Suggested artwork!" }),
    fabricate("artwork"),
  ])
)

gravity.get("/api/v1/related/genes", (req, res) =>
  res.send([fabricate("gene", { title: "Related gene!" }), fabricate("gene")])
)

gravity.get("/api/v1/xapp_token", (req, res) =>
  res.send({ xapp_token: "xapp_foobar", expires_in: "expires in utc string" })
)

gravity.get("/unsupported_route", (req, res) =>
  res.send("I'm in ur microgravitiez rendering ur pagez!")
)

gravity.get("/api/v1/match", (req, res) =>
  res.send([fabricate("artwork", { value: "Skull", model: "artwork" })])
)

gravity.get("/api/v1/admins/available_representatives", (req, res) =>
  res.send([fabricate("user")])
)

gravity.get("/api/v1/fair/:id", (req, res) => res.send(fabricate("fair")))

gravity.get("/api/v1/tag/:id", (req, res) => res.send(fabricate("tag")))

gravity.get("/api/v1/fair/:id/sections", (req, res) =>
  res.send([
    { section: "FOCUS", partner_shows_count: 13 },
    { section: "Pier 92", partner_shows_count: 42 },
  ])
)

gravity.get("/api/v1/fair/:id/shows", (req, res) =>
  res.send({
    results: [
      fabricate("show", {
        fair: fabricate("fair"),
        fair_location: { display: "Dock 4" },
        artworks: [fabricate("artwork")],
      }),
    ],
  })
)

gravity.get("/api/v1/sets", (req, res) => res.send([fabricate("set")]))

gravity.get("/api/v1/set/:id/items", (req, res) =>
  res.send([fabricate("featured_link"), fabricate("featured_link")])
)

gravity.get("/api/v1/profile/:id", function(req, res) {
  if (req.params.id === "404") {
    return res.send(404, "Not Found.")
  } else if (req.params.id === "thearmoryshow") {
    return res.send(
      fabricate("profile", {
        owner_type: "Fair",
        owner: { default_fair_id: "the-armory-show" },
      })
    )
  } else if (req.params.id === "gagosian-gallery") {
    return res.send(
      fabricate("profile", {
        owner_type: "PartnerGallery",
        owner: fabricate("partner", { id: "gagosian-gallery" }),
      })
    )
  } else if (req.params.id === "lacma") {
    return res.send(
      fabricate("profile", {
        owner_type: "PartnerMuseum",
        owner: fabricate("partner", { id: "lacma" }),
      })
    )
  } else {
    return res.send(fabricate("profile", { owner_type: "User" }))
  }
})

gravity.get("/api/v1/partner/:id", function(req, res) {
  if (req.params.id === "gagosian-gallery") {
    return res.send(
      fabricate("partner", {
        id: "gagosian-gallery",
        default_profile_id: "gagosian-gallery",
        displayable_shows_count: 2,
        profile: fabricate("profile", {
          owner_type: "PartnerGallery",
          owner: fabricate("partner", { id: "gagosian-gallery" }),
        }),
      })
    )
  } else if (req.params.id === "lacma") {
    return res.send(
      fabricate("partner", {
        id: "lacma",
        default_profile_id: "lacma",
        displayable_shows_count: 1,
        name: "Los Angeles County Museum Of Art",
        published_not_for_sale_artworks_count: 1,
        published_for_sale_artworks_count: 1,
        profile: fabricate("profile", {
          owner_type: "PartnerMuseum",
          owner: fabricate("partner", { id: "lacma" }),
        }),
      })
    )
  } else {
    return res.send(fabricate("partner"))
  }
})

gravity.get("/api/v1/partner/:id/locations", function(req, res) {
  if (req.query.page > 2) {
    return res.send([])
  }
  return res.send([fabricate("location"), fabricate("location")])
})

gravity.get("/api/v1/partner/:id/shows", function(req, res) {
  if (req.query.page > 2) {
    return res.send([])
  }
  return res.send([
    fabricate("show", { status: "closed", featured: true }),
    fabricate("show", { status: "running", featured: false }),
  ])
})

gravity.get("/api/v1/partner/:id/artworks", function(req, res) {
  if (req.query.page > 2) {
    return res.send([])
  }
  return res.send([fabricate("artwork"), fabricate("artwork")])
})

gravity.get("/api/v1/search/filtered/fair/:id/options", (req, res) =>
  res.send({ medium: { Painting: "painting" } })
)

gravity.get("/api/v1/profile/alessandra/posts", (req, res) =>
  res.send([fabricate("post")])
)

gravity.get("/api/v1/page/:id", (req, res) =>
  res.send(fabricate("page", { content: "This *page* is awesome!" }))
)

gravity.get("/local/*", (req, res) => res.send("img.jpg"))

gravity.get("/api/v1/artwork/.*/flag", (req, res) =>
  res.send([fabricate("artwork")])
)

gravity.get("/api/v1/me", (req, res) => res.send(fabricate("user")))

gravity.get("/api/v1/me/authentications", (req, res) =>
  res.send([
    { id: "123", uid: "456", provider: "facebook" },
    { id: "789", uid: "321", provider: "twitter" },
  ])
)

gravity.get("/api/v1/me/partners", (req, res) =>
  res.send([fabricate("partner")])
)

gravity.post("/api/v1/me/unsubscribe*", (req, res) =>
  res.send([fabricate("user")])
)

gravity.get("/api/v1/artist/:id", (req, res) => res.send(fabricate("artist")))

gravity.post("/api/v1/me/artwork_inquiry_request", (req, res) =>
  res.send(fabricate("user"))
)

gravity.get("/post", (req, res) => res.send("Get your post on!"))

gravity.all("/oauth2/access_token", (req, res) =>
  res.send({
    access_token: "test-access-token",
    expires_in: "2020-08-28T12:10:22Z",
  })
)

gravity.get("/oauth2/authorize", function(req, res) {
  if (req.param("redirect_uri")) {
    return res.redirect(req.param("redirect_uri") + "?code=test-oauth-code")
  }
  return res.send(`<!DOCTYPE html> \
<html> \
<body> \
<form> \
<input type='hidden' name='redirect_uri' value='${req.query.redirect_uri}' /> \
<input type='submit' value='Login'/> \
</form> \
</body> \
</html>`)
})

gravity.get("/api/v1/user/:id", (req, res) => res.send(fabricate("user")))

gravity.get("/api/v1/user/:id/access_controls", (req, res) =>
  res.send([fabricate("access_control")])
)

gravity.get("/api/v1/show/:id", (req, res) => res.send(fabricate("show")))

gravity.get("/api/v1/related/sales", (req, res) =>
  res.send([fabricate("sale")])
)

gravity.get("/api/v1/sale/:sale_id/sale_artwork/:id", (req, res) =>
  res.send(fabricate("sale_artwork"))
)

//
// API V2 -----------------------------------------------------------------------
//

gravity.get("/api", (req, res) =>
  res.send(
    JSON.parse(
      require("./hal_root").replace(
        /ROOT/g,
        req.protocol + "://" + req.get("host") + req.originalUrl
      )
    )
  )
)

gravity.get("/api/current_user", function(req, res) {
  const root =
    req.protocol +
    "://" +
    req.get("host") +
    req.originalUrl.replace("current_user", "")
  return res.send(fabricate2("current_user"))
})

gravity.get("/api/profiles/:id", (req, res) =>
  res.send(
    (() => {
      switch (req.params.id) {
        case "gagosian-gallery":
          return fabricate2("partner_profile")
        default:
          return fabricate2("user_profile")
      }
    })()
  )
)

gravity.get("/api/user_details/:id", (req, res) =>
  res.send(fabricate2("user_details"))
)

gravity.get("/api/artworks/:id", (req, res) => res.send(fabricate2("artwork")))

gravity.get("/api/artists", (req, res) => res.send(fabricate2("artists")))

gravity.get("/api/partners/:id", (req, res) => res.send(fabricate2("partner")))

gravity.get("/api/search", function(req, res) {
  if (req.query.q === "NoResults") {
    return res.send(fabricate2("empty_search"))
  }
  return res.send(fabricate2("search"))
})

gravity.post("/api/tokens/xapp_token", (req, res) =>
  res.send({ type: "xapp_token", token: "foo-token", _links: {} })
)

let partnersReqCount = 0
gravity.get("/api/partners", function(req, res) {
  let json
  partnersReqCount++
  if (partnersReqCount < 5) {
    json = {
      _embedded: { partners: [fabricate2("partner")] },
      _links: {
        next: { href: `${GRAVITY_URL}/api/partners?cursor=foo-cursor` },
      },
    }
  } else {
    partnersReqCount = 0
    json = { _embedded: { partners: [] } }
  }
  return res.send(json)
})

gravity.all("*", (req, res) => res.send(404, "Not Found."))
