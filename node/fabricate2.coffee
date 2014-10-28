#
# A function that helps create fixture data modeled after the Gravity API.
# Pass in the name of the model and any extending data and it'll return
# a vanilla javascript object populated with fixture json data.
#
# e.g. `fabricate('artwork', { title: 'Three Wolf Moon'` })
#

_ = require 'underscore'

module.exports = fabricate = (type, extObj = {}) ->

  _.extend switch type

    when 'current_user'
      id: "4d8cd73191a5c50ce200002a"
      name: "Craig Spaeth"
      _links:
        self:
          href: "http://localhost:5000/__gravity/api/users/4d8cd73191a5c50ce200002a"

        profile:
          href: "http://localhost:5000/__gravity/api/profiles/5086df098523e60002000012"

        user_details:
          href: "http://localhost:5000/__gravity/api/user_details/4d8cd73191a5c50ce200002a"

    when 'user_profile'
      id: "5086df098523e60002000012"
      created_at: "2012-10-23T18:16:41+00:00"
      updated_at: "2014-09-24T20:38:41+00:00"
      handle: "craig"
      location: "New York, New York"
      description: "Developer at Artsy. My heart swoons for code, art, & indie games."
      _links:
        curies: [
          name: "image"
          href: "http://stagic3.artsy.net/profile_icons/504e2c4fbb39040002000483/{rel}"
          templated: true
        ]
        thumbnail:
          href: "/assets/shared/missing_image.png"
        "image:self":
          href: "{?image_version}.jpg"
        self:
          href: "https://stagingapi.artsy.net/api/profiles/5086df098523e60002000012"
        permalink:
          href: "https://staging.artsy.net/craig"
        website:
          href: ""
      image_versions: ["square140"]

    when 'user_details'
      id: "4d8cd73191a5c50ce200002a"
      created_at: "2011-07-18T17:53:47+00:00"
      updated_at: "2014-10-03T01:59:14+00:00"
      type: "Admin"
      email: "craig@artsymail.com"
      birthday: null
      phone: ""
      gender: null
      _links:
        self:
          href: "http://localhost:5000/__gravity/api/user_details/4d8cd73191a5c50ce200002a"

        user:
          href: "http://localhost:5000/__gravity/api/user/4d8cd73191a5c50ce200002a"

    when 'artwork'
      {"id":"4d8b93ba4eb68a1b2c001c5b","created_at":"2010-12-20T19:48:55+00:00","updated_at":"2014-08-12T18:10:21+00:00","title":"Skull","category":"Paintings","medium":"Synthetic polymer paint and silkscreen ink on canvas","date":"1976","dimensions":{"in":{"text":"132 Ã— 150 in","height":132.0,"width":150.0,"depth":0.0,"diameter":null},"cm":{"text":"335.3 Ã— 381 cm","height":335.3,"width":381.0,"depth":0.0,"diameter":null}},"website":"","signature":"","series":null,"provenance":"","literature":"","exhibition_history":"","collecting_institution":"","additional_information":"","image_rights":"Â© 2012 The Andy Warhol Foundation for the Visual Arts, Inc. / Artists Rights Society (ARS), New York","blurb":"","unique":false,"cultural_maker":null,"can_inquire":true,"can_acquire":false,"can_share":true,"sale_message":null,"sold":false,"_links":{"curies":[{"name":"image","href":"http://static0.artsy.net/additional_images/4e68f259528702000104c329/1/{rel}","templated":true}],"thumbnail":{"href":"http://static0.artsy.net/additional_images/4e68f259528702000104c329/1/medium.jpg"},"image:self":{"href":"{?image_version}.jpg","templated":true},"partner":{"href":"http://localhost:5000/__gravity/api/partners/4d8b92c44eb68a1b2c0004cb"},"self":{"href":"http://localhost:5000/__gravity/api/artworks/4d8b93ba4eb68a1b2c001c5b"},"permalink":{"href":"http://artsy.net/artwork/andy-warhol-skull"},"genes":{"href":"http://localhost:5000/__gravity/api/genes?artwork_id=4d8b93ba4eb68a1b2c001c5b"},"artists":{"href":"http://localhost:5000/__gravity/api/artists?artwork_id=4d8b93ba4eb68a1b2c001c5b"}},"image_versions":["small","square","medium","large","larger","normalized","tall","medium_rectangle","large_rectangle"],"_embedded":{"editions":[]}}

    when 'artists'
      {"total_count":null,"_links":{"self":{"href":"http://localhost:5000/__gravity/api/artists?artwork_id=4d8b93ba4eb68a1b2c001c5b"},"next":{"href":"http://localhost:5000/__gravity/api/artists?artwork_id=4d8b93ba4eb68a1b2c001c5b&cursor=warhol-andy%3A4d8b92b34eb68a1b2c0003f4"}},"_embedded":{"artists":[{"id":"4d8b92b34eb68a1b2c0003f4","created_at":"2010-08-23T14:15:30+00:00","updated_at":"2014-10-23T16:44:01+00:00","name":"Andy Warhol","gender":"male","birthday":"1928","hometown":"Pittsburgh, Pennsylvania","location":"New York ","nationality":"American","statement":"","biography":"An American painter, printmaker, sculptor, draughtsman, illustrator, filmmaker, writer and collector, who became one of the most famous artists of the 20th century. Warhol began his career as a successful commercial artist and illustrator for magazines and newspapers but by 1960 was determined to establish his name as a painter. He quickly became renowned for painting everyday advertisements or images from comic strips that looked eerily similar to the originals and contained no traditional marks of an artist. Warhol accentuated this look through the use of silkscreens and by painting in collaboration with a team of assistants in a studio he called \"The Factory.\" In the late sixties, Warhol turned his attention to making experimental films and multimedia events, and in the 1970s, to creating commissioned portraits. During the 1980s Warhol continued to exert an influence on the art world, collaborating with young artists such as Jean-Michel Basquiat and creating a series of paintings, which engaged with Renaissance masterworks.","blurb":"Obsessed with celebrity, consumer culture, and mechanical (re)production, [Pop artist](/gene/pop-art) Andy Warhol created some of the most iconic images of the 20th century. As famous for his quips as for his artâ€”he variously mused that â€œart is what you can get away withâ€ and â€œeveryone will be famous for 15 minutesâ€â€”Warhol drew widely from popular culture and everyday subject matter, creating works like his _32 Campbell's Soup Cans_ (1962), [Brillo pad box sculptures](/artwork/andy-warhol-set-of-four-boxes-campbells-tomato-juice-del-monte-peach-halves-brillo-soap-pads-heinz-tomato-ketchup), and portraits of Marilyn Monroe, using the medium of silk-screen printmaking to achieve his characteristic hard edges and flat areas of color. Known for his cultivation of celebrity, Factory studio (a radical social and creative melting pot), and avant-garde films like _Chelsea Girls_ (1966), Warhol was also a mentor to artists like [Keith Haring](/artist/keith-haring) and [Jean-Michel Basquiat](/artist/jean-michel-basquiat). His Pop sensibility is now standard practice, taken up by major contemporary artists [Richard Prince](/artist/richard-prince), [Takashi Murakami](/artist/takashi-murakami), and [Jeff Koons](/artist/jeff-koons), among countless others.","education":"","awards":"","publications":"","collections":"","soloexhibitions":"","groupexhibitions":"","_links":{"curies":[{"name":"image","href":"http://static1.artsy.net/artist_images/52f6bdda4a04f5d504f69b03/1/{rel}","templated":true}],"thumbnail":{"href":"http://static1.artsy.net/artist_images/52f6bdda4a04f5d504f69b03/1/four_thirds.jpg"},"image:self":{"href":"{?image_version}.jpg","templated":true},"self":{"href":"http://localhost:5000/__gravity/api/artists/4d8b92b34eb68a1b2c0003f4"},"permalink":{"href":"http://artsy.net/artist/andy-warhol"},"artworks":{"href":"http://localhost:5000/__gravity/api/artworks?artist_id=4d8b92b34eb68a1b2c0003f4"},"genes":{"href":"http://localhost:5000/__gravity/api/genes?artist_id=4d8b92b34eb68a1b2c0003f4"}},"image_versions":["square","tall","large","four_thirds"]}]}}

    when 'partner'
      {"id":"4d8b92c44eb68a1b2c0004cb","created_at":"2011-03-24T18:51:48+00:00","updated_at":"2014-10-21T07:01:23+00:00","type":"Gallery","name":"Gagosian Gallery","email":"newyork@gagosian.com","region":"North America","_links":{"self":{"href":"http://localhost:5000/__gravity/api/partners/4d8b92c44eb68a1b2c0004cb"},"profile":{"href":"http://localhost:5000/__gravity/api/profiles/gagosian-gallery"},"artworks":{"href":"http://localhost:5000/__gravity/api/artworks?partner_id=4d8b92c44eb68a1b2c0004cb"},"shows":{"href":"http://localhost:5000/__gravity/api/shows?partner_id=4d8b92c44eb68a1b2c0004cb"},"permalink":{"href":"http://artsy.net/gagosian-gallery"},"website":{"href":"http://www.gagosian.com"}}}