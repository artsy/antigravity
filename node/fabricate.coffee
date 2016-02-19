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

    when 'flag'
      id: 'foo' + _.uniqueId()
      author:
        id: '2f3'
        name: 'Craig Spaeth'
      title: 'This genome sucks'
      body: 'Just dont genome this stuff'
      created_at: '2011-12-12T18:51:39-05:00'

    when 'admin_note'
      id: 'foo' + _.uniqueId()
      body: 'This is a really kind user'
      created_at: '2011-12-12T18:51:39-05:00'
      category: 'collected_before'

    when 'artist_note'
      id: 'foo' + _.uniqueId()
      body: 'Loves this artist'
      artist: fabricate 'artist'
      author: fabricate 'user'
      created_at: '2011-12-12T18:51:39-05:00'

    when 'artist_bookmark'
      id: 'foo' + _.uniqueId()
      artist_name: 'Dennis Percell'
      comment: 'I really like this'
      user: fabricate 'user'
      updated_at: '2011-12-12T18:51:39-05:00'

    when 'artwork'
      id: 'skull' + _.uniqueId()
      title: 'Skull'
      artist:
        id: 'andy-warhol'
        name: "Andy Warhol"
      images: [
        fabricate 'artwork_image'
        fabricate 'artwork_image', is_default: true
      ]
      edition_sets: [
        fabricate 'edition_set'
      ]
      flags: [
        fabricate 'flag'
      ]
      partner: fabricate 'partner'
      category: 'Painting'
      series: 'The coolest series'
      signature: 'Signed by picasso'
      additional_information: 'Urinated on in 2007'
      exhibition_history: 'MOMA, LACMA, and CAC'
      provenance: 'Pwned by the big LG'
      literature: 'Featured in Wired'
      dimensions:
        in: '10 × 20 × 30in'
        cm: '100 × 200 × 40cm'
      metric: 'in'
      display: 'Skull by Andy Warhol'
      collecting_institution: 'MOMA'
      image_rights: 'Sourced from ARS'
      date: '1999'
      medium: 'Watercolor on Paper'
      can_share_image: false
      published: true
      private: false
      tags: []
      genome: fabricate 'genome'

    when 'artwork_image'
      aspect_ratio: 2
      id: _.uniqueId()
      image_filename: "original.jpg"
      image_url: "/local/additional_images/4e7cb83e1c80dd00010038e2/1/:version.jpg"
      image_versions: ['small', 'square', 'medium', 'large', 'larger', 'best', 'normalized']
      is_default: false
      max_tiled_height: 585
      max_tiled_width: 1000
      original_height: 585
      original_width: 1000
      tile_base_url: "/local/additional_images/4e7cb83e1c80dd00010038e2/1/dztiles-512-0"
      tile_format: "jpg"
      tile_overlap: 0
      tile_size: 512

    when 'show_install_shot'
      id: "525cb7488b3b810e050001af#{_.uniqueId()}"
      position: 2282
      default: false
      aspect_ratio: 1.33
      original_height: 3312
      original_width: 4416
      image_versions: [ "medium", "tall", "large", "larger", "featured", "general" ]
      image_url: "http://static1.artsy.net/partner_show_images/525cb7488b3b810e050001af/1/:version.jpg"


    when 'edition_set'
      id: '34f4wawe' + _.uniqueId()
      editions: '1,2,3 of 10'
      dimensions:
        in: '10 × 20 × 30in'
        cm: '100 × 200 × 40cm'
      metric: 'in'

    when 'partner'
      id: 'gagosian' + _.uniqueId()
      _id: '5086df098523e60002000012'
      name: 'Gagosian Gallery'
      admin: fabricate 'user'
      sortable_id: 'gagosian'
      default_profile_id: 'gagosian'
      type: 'Gallery'
      representations: []

    when 'profile_cover_image'
      id: _.uniqueId()
      position: 36
      default: false
      aspect_ratio: 1.75
      original_height: 550

    when 'partner_profile'
      bio: "The J. Paul Getty Trust is a cultural and philanthropic institution dedicated to critical thinking in the presentation, conservation, and interpretation of the world's artistic legacy."
      cover_image: fabricate 'profile_cover_image'
      default_icon_version: "square"
      follows_count: 667
      icon: fabricate 'profile_icon'
      id: "getty"
      location: ""
      owner: fabricate 'partner'
      owner_type: "PartnerInstitution"
      posts_count: 1
      private: false
      published: true
      reposts_count: 1
      short_description: null
      subtype: null
      website: "http://getty.edu/"

    when 'artist'
      id: 'pablo-picasso' + _.uniqueId()
      name: 'Pablo Picasso'
      blurb: 'This is Pablo Picasso'
      artworks_count: 2
      image_url: '/foo/bar/:version'
      years: '1900-2000'
      genome: fabricate 'genome'

    when 'featured_link'
      id: _.uniqueId()
      href: '/cats/bitty'
      title: 'This is a page all about Bitty'
      subtitle: "If you are interested in cats, and specifically the best cat in the world, you've come to the right place"
      image_url: '/bitty/:version'
      image_versions: ["large_square", "medium_square", "small_square", "medium_rectangle", "large_rectangle", "small_rectangle", "wide"]
      item_type: 'FeaturedLink'

    when 'user'
      id: '54276766fd4f50996aeca2' + _.random(10,99)
      name: 'Craig Spaeth'
      website: null
      email: 'craigspaeth@gmail.com'
      type: 'Admin'
      lab_features: []
      profession: 'engineer'
      address: '401 Broadway'
      collector_level: '5'
      default_profile_id: "alessandra"
      likely_to_purchase: 0
      get: (attr) -> return @[attr]
      set: (attrs) -> _.extend @, attrs

    when 'profile'
      icon:
          id: "504e3beab19ddf0002000534"
          image_filename: "IMG_2663_retouched.jpg"
          image_url: "http://static0.artsy.net/profile_icons/504e3beab19ddf0002000534/:version.jpg"
          versions: ["circle", "square"]
          x: 16
          y: 18
          width: 172
      owner: fabricate 'user'
      posts_count: 2
      id: "alessandra"
      subtype: null
      website: ""
      location: "New York"
      private: false
      bio: "Living the dream as Content Partner Manager @Artsy. In a serious relationship with: dance floors, breakfast burritos, and historical biographies."
      default_icon_version: "circle"
      owner_type: "Admin"
      follows_count: 50
      short_description: null
      published: true

    when 'profile_icon'
      id: _.uniqueId()
      image_filename: "original.jpg"
      image_url: "/local/profile_icons/id/:version.jpg"
      versions: ['square', 'circle']
      profileId: 'user_profile'
      width: 140

    when 'invitation'
      email: "erchaves@gmail.com"
      id: _.uniqueId()
      message: ""
      name: "Eric Chaves Chaves"
      status: "joined"

    when 'status'
      id: _.uniqueId()
      created_at: '2011-11-25T01:10:56-05:00'
      title: 'needs follow-up'

    when 'shortcut'
      short: 'short'
      long: "http://localhost:5000/terms"

    when 'offer'
      id: 'offer_id' + _.uniqueId()
      artwork: fabricate 'artwork'
      user: fabricate 'user'
      description: "Aute terry richardson ullamco, bicycle rights aliquip aesthetic."
      hide_price: true
      partner_name: null
      statuses: [ fabricate 'status' ]

    when 'offer_artist'
      id: 'offer_id' + _.uniqueId()
      artist: fabricate 'artist'
      user: fabricate 'user'
      statuses: [ fabricate 'status' ]

    when 'artwork_inquiry_request'
      artwork: fabricate 'artwork'
      contact_gallery: false
      id: 'foobaz' + _.uniqueId()
      created_at: '2011-11-25T01:10:56-05:00'
      message: 'Oh Hai! I <3 this artwork!'
      phone: '555-555-5555'
      user: fabricate 'user'
      statuses: [
        fabricate 'status'
        fabricate 'status'
      ]
      flags: [
        fabricate 'flag'
      ]

    when 'location'
      id: 'foo' + _.uniqueId()
      address: "529 W 20th St."
      address_2: "2nd Floor"
      city: "New York"
      state: "NY"
      postal_code: "10011"
      geo_point: ""

    when 'film'
      id: "andy-warhol-foobar"
      title: "Foobar"
      blurb: "foo"
      additional_information: "bar"
      youtube_video_id: "a-9NGXas1M8"
      default_video_still_id: _.uniqueId()
      artist: module.exports('artist')
      artworks: [module.exports('artwork')]
      video_stills: [fabricate 'video_still']

    when 'lab_feature'
      id: 'feature' + _.uniqueId()
      name: 'Cool Feature'
      description: 'Cool Feature, like the name suggests'
      created_by: fabricate 'user'

    when 'video_still'
      id: _.uniqueId()
      is_default: true
      image_filename: "400.jpg"
      image_url: "/local/video_stills/4f7e6a3b4b2a4f544100022f/:version.jpg"

    when 'document'
      id: _.uniqueId()
      filename: "whatever.pdf"

    when 'pageview'
      id: _.uniqueId()
      artwork_id: "matthew-craven-the-bust"
      city: null
      country_code: null
      type: "artwork"
      viewed_at: "2012-06-01T11:36:26-04:00"

    when 'pageview_count'
      id = _.uniqueId()
      count: 30
      id: id
      s: id

    when 'access_control'
      id: _.uniqueId()
      property: fabricate 'partner'

    when 'health_snapshot'
      score: 9001.0
      type: 'participation'
      partner: module.exports('partner')
      breakdown:
        important_count: 42.0
        unimportant_count: 8959.0
      raw_detail:
        important_count:
          current: 0.14
        unimportant_count:
          total: 0.88
          "last 30 days": 0.44
          "last 60 days": 0.22

    when 'show'
      _id: '4d8cd73191a5c50ce210002a'
      id: 'gagosian-gallery-inez-and-vinoodh' + _.uniqueId()
      partner: fabricate 'partner'
      fair: null
      location: fabricate('location')
      fair_location: null
      partner: fabricate('partner')
      name: 'Inez & Vinoodh'
      image_url: '/local/partner_show_images/51f6a51d275b24a787000c36/1/:version.jpg'
      image_versions: [ 'medium', 'tall', 'large', 'larger', 'featured', 'general' ]
      featured: false
      start_at: '2013-07-12T04:00:00+00:00'
      end_at: '2013-08-23T04:00:00+00:00'
      eligible_artworks_count: 6
      displayable: true
      images_count: 0
      status: 'closed'
      updated_at: '2013-09-26T15:03:29Z'
      coordinates: null
      events: [
        {
          _id: "556c77227261694a5fef0600"
          title: "Inez and Vinoodh Opening"
          start_at: "2015-01-07T20:00:00+00:00"
          end_at: "2015-01-07T21:00:00+00:00"
          description: "Inez and Vinoodh present their new works."
          event_type: "Opening Reception"
        }
        {
          _id: "556c77227261694a5fef0600",
          title: "Inez and Vinoodh Gallery Walkthrough",
          start_at: "2015-01-08T19:15:00+00:00",
          end_at: "2015-01-09T02:00:00+00:00",
          description: "Artists Inez and Vinoodh visit the gallery.",
          event_type: "Other"
        }
      ]

    when 'page'
      content: 'This is an awesome page'
      id: _.uniqueId()
      name: 'Awesome Page'

    when 'representation'
      id: _.uniqueId()
      artist: fabricate 'artist'
      image_url: "/local/partner_artists/id/:version.jpg"
      image_versions: ['four_thirds', 'square', 'four_thirds_retina']

    when 'site_hero_unit'
      name: _.uniqueId()
      description: 'My hero'
      heading: 'Welcome and thank you for using Artsy.'
      credit_line: 'credit_line'
      mobile_title: 'mobile_title'
      mobile_description: 'mobile_description'
      start_at: '2013-01-25T01:10:56-05:00'
      end_at: '2014-11-25T01:10:56-05:00'
      type: 'My hero'
      link: '/terms'
      link_text: 'Browse Fairs'
      enabled: true
      menu_color_class: 'black'
      link_background_hover_hex: 'FFFFFF'
      link_border_off_hex: 'FFFFFF'
      title_image_url: "/local/hero_units/id/title.png"
      title_image_retina_url: "/local/hero_units/id/title-2x.png"
      background_image_url: "/local/hero_units/id/wide.jpg"
      background_image_mobile_url: "/local/hero_units/id/square.jpg"

    when 'partner_contact'
      id: "melissa-lazarov" + _.uniqueId()
      name: "Melissa Lazarov"
      email: "artsy@gagosian.com"
      phone: ""
      position: ""

    when 'gene'
      type:
        properties: [
          {
            key: "use_as_filter"
            value: "true"
          }
          {
            key: "use_in_artist_related_genes"
            value: "true"
          }
          {
            key: "browse_category"
            value: "Style or Movement"
          }
        ]
        id: "j1-style-or-movement"
        name: "J1 - Style or Movement"
        published: false

      influential_artist: null
      influential_gene: null
      id: "pop-art" + _.uniqueId()
      name: "Pop Art"
      description: "_“The Pop artists did images that anybody walking down Broadway could recognize in a split second—comics, picnic tables, men’s trousers, celebrities, shower curtains, refrigerators, coke bottles—all the great modern things that the Abstract Expressionists tried so hard not to notice at all.” –[Andy Warhol](/artist/andy-warhol)_\n\n&nbsp;\n\nPop Art was the dominant movement in early-1960s American art. Short for “popular art,” it featured common household objects and consumer products like Coca-Cola and Campbell’s Soup cans, as well as forms of media—such as comics, newspapers, and magazines—recognizable to the masses. Artists often created Pop works using mechanical or commercial techniques, such as silk-screening. As Warhol suggests, the choice of mundane subject matter and machine-like techniques was a blunt rejection of the heroic subjects and methods of [Abstract Expressionism](/gene/abstract-expressionism), the leading American movement of the 1950s. Not often discussed is the fact that Pop Art originated in England and paralleled similar movements in France and Germany."
      image_url: "http://static0.artsy.net/genes/4e5e41670d2c670001030350/:version.jpg"
      image_versions: [
        "thumb"
        "square"
        "tall"
        "big_and_tall"
      ]
      counts:
        artworks: 1611
        artists: 80

      published: true
      follow_count: 511
      browseable: true
      created_at: "2011-08-31T14:12:55Z"

    when 'gene_type'
      id: "art-historical-influences" + _.uniqueId()
      name: "Art-Historical Influences"
      properties: []

    when 'genome'
      genes: { 'Bad Art': 100, 'Contemporary Pugalism': 80, 'Furry': 10 }

    when 'collecting_category'
      id: _.uniqueId()
      gene: fabricate 'gene'

    when 'catalog_page'
      id: _.uniqueId()
      submitted: true
      artwork: fabricate 'artwork'
      artists: [fabricate 'artist', fabricate 'artist']

    when 'order'
      id: _.uniqueId()
      state: 'submitted'
      code: "FOO#{_.uniqueId()}"
      user: fabricate 'user'
      line_items: [ fabricate 'order_line_item' ]
      token: 'foobaz'
      item_total_cents: 180000
      tax_total_cents: 0
      total_cents: 180000
      item_total: '$1,800.00'
      tax_total: '$0.00'
      total: '$1,800.00'

    when 'order_line_item'
      id: _.uniqueId()
      artwork: fabricate 'artwork'
      quantity: 1
      shipping_note: "HI I'm a shipping note"
      sale_conditions_url: 'http://shipping.conditions.com'
      price_cents: 180000
      tax_cents: 0
      subtotal_cents: 180000
      price: '$1,800.00'
      subtotal: '$1,800.00'
      artwork: fabricate('artwork')
      edition_set: fabricate('edition_set', acquireable: true, sold: false, forsale: true, price: '$1,800' )
      partner: fabricate('partner')
      partner_location: fabricate('partner_location')

    when 'fair'
      id: "armory-show-2013"
      start_at: new Date()
      end_at: new Date()
      location: fabricate 'location'
      name: "Armory Show 2013"
      contact: 'Design Miami/ Office\nCall + 1 555 555 5555'
      links: '[Google](http://google.com)'
      summary: '**foobar**'
      about: 'We Rawk!'
      default_profile_id: 'the-armory-show'
      organizer:
        profile_id: 'the-armory-show'
        name: 'Armory Show'

    when 'fair_organizer'
      default_fair_id: "armory-show-2013"
      profile_id: "the-armory-show"
      id: "armory-show-2013"
      name: "Armory Show Fair Organizer"

    when 'fair_organizer_profile'
      cover_image: null
      posts_count: 0
      reposts_count: 8
      owner: fabricate 'fair_organizer'
      id: "the-armory-show"
      subtype: null
      website: "http://getty.edu/"
      location: null
      private: false
      bio: "Awesome Fair Organizer"
      default_icon_version: "square"
      owner_type: "FairOrganizer"
      follows_count: 307
      short_description: null
      published: true

    when 'fair_profile'
      cover_image: null
      posts_count: 0
      reposts_count: 8
      owner: fabricate 'fair'
      id: "the-armory-show"
      subtype: null
      website: "http://getty.edu/"
      location: null
      private: false
      bio: "Awesome Fair"
      default_icon_version: "square"
      owner_type: "Fair"
      follows_count: 307
      short_description: null
      published: true

    when 'sale'
      id: "whtney-art-party"
      name: 'Whitney Art Party'
      description: "This is a great party"
      buyers_premium: {
        '_id': '54cff2e3776f7266e5000000'
        'id': 'la-modern'
        'name': 'LA Modern'
        'schedule': [
          {
            'min_amount_cents': 0
            'percent': 0.25
          }
          {
            'min_amount_cents': 50000000
            'percent': 0.15
          }
        ]
      }


    when 'feature'
      id: "bitty-the-cat"
      name: 'A Feature all about the greatest cat'
      description: "This is a great cat, the best."
      image_url: 'foo/bar/:version.jpg'

    when 'set'
      id: _.uniqueId()
      key: 'homepage:featured'
      item_type: 'FeaturedLink'
      display_on_mobile: true
      display_on_desktop: true

    when 'featured_partners'
      created_at: "2013-08-27T01:28:36Z"
      description: ""
      display_on_desktop: true
      display_on_mobile: true
      id: _.uniqueId()
      item_type: "Profile"
      key: "partners:featured-partners"
      name: "Featured Partners"
      owner: null
      owner_type: null
      published: true

    when 'featured_partners_profiles'
      [
        fabricate 'partner_profile',
        fabricate 'partner_profile',
        fabricate 'partner_profile',
        fabricate 'partner_profile',
        fabricate 'partner_profile',
        fabricate 'partner_profile'
      ]

    when 'sale_artwork'
      id: _.uniqueId()
      user_notes: 'This is a very nice note.'
      position: 1
      artwork: fabricate 'artwork'

    when 'fair_category'
      id: _.uniqueId()
      group: 'Group 1'
      url: 'http://www.google.com'
      position: 1
      description: 'This is a very nice description'

    when 'delayed_task'
      id: _.uniqueId()
      description: "Contains eligible artworks for upcoming partner shows."
      last_updated: "2012-11-14T08:53:42Z"
      name: "Currently featured partner show artworks"

    when 'delayed_job_worker'
      id: _.uniqueId()
      name: "delayed_job.99  host:ip-10-46-218-45"
      queues: "[imgs]"
      status: "stopped"
      updated_at: "2012-11-09T02:55:47Z"

    when 'delayed_job'
      attempts: 24
      handler: "foo"
      id: _.uniqueId()
      last_error: "bar"
      locked_at: null
      locked_by: null
      name: "Artwork[50c932a7b7902c88ea000d01].additional_images.find()#recreate_image_versions!"
      priority: 3
      run_at: "2013-01-03T21:42:37Z"

    when 'mail_template'
      class_name: "ArtworkInquiryRequestMailer"
      content: "foobuu"
      id: "artworkinquiryrequestmailer-artwork-inquiry-batch-confirmation-email"
      method_name: "artwork_inquiry_batch_confirmation_email"
      subject: "boofoo"

    when 'weekly_email'
      id: _.uniqueId()
      subject: "artsy mail"
      html: "<html><body>Fancy html is here</body></html>"

    when 'email'
      subject: "artsy mail"
      html: "<html><body>Fancy html is here</body></html>"

    when 'weekly_email_new'
      subject: ""
      html: ""

    when 'weekly_email_section'
      _type: ""

    when 'weekly_email_section_artworks'
      id: _.uniqueId()
      _type: "WeeklyEmailSectionArtworks"
      promo: "look at those Artworks"
      name: "Artworks Selection"
      description: "some text to go with artworks"
      artworks: [fabricate 'artwork']

    when 'gene_automation_rule'
      acts_on: "artwork"
      created_at: "2012-08-24T15:39:51Z"
      description: "Career Stage Gene is ` in the Artist genome, and is simply propagated to all of the artist's artworks!"
      id: _.uniqueId()
      satisfies: "obj.artist.genome.genes['Career Stage Gene']"
      value: "obj.artist.genome.genes['Career Stage Gene']"

    when 'tag'
      id: _.uniqueId()
      count: 10
      name: 'Cow'

    when 'genome_map'
      genes:
        "A - Awesome Genes":
          "Bad Art": 0
        "B - Kewl Art":
         'Contemporary Pugalism': 80, 'Furry': 10

    when 'post'
      _id: _.uniqueId()
      _type: "Post"
      author: fabricate 'author'
      artworks: [fabricate 'artwork']
      attachments: []
      body: "<p>Check out the original flowers photograph taken by Patricia Caulfield which Warhol stole to make his painting.</p>"
      content_links: []
      created_at: "2013-06-27T03:25:00Z"
      default_image_url: "http://static2.artsy.net/post_images/51cbb219f61af55db8000061/large.jpg"
      featured: true
      id: "billpowers-check-out-the-original-flowers-photograph-taken-by-patricia"
      last_promoted_at: "2013-06-27T15:30:52Z"
      likes_count: 11
      post_images: []
      profile: {}
      published: true
      published_at: "2013-06-27T03:32:58Z"
      reposts_count: 0
      summary: " Check out the original flowers photograph taken by Patricia Caulfield which Warhol stole to make his painting. "
      title: ""
      updated_at: "2013-06-27T15:31:21Z"
      profile: fabricate 'profile'

    when 'author'
      default_profile_id: "billpowers"
      id: _.uniqueId()
      name: "Bill Powers"
      type: "User"

    when 'auction_result'
      auction_date: "2012-05-23T00:00:00Z"
      auction_dates_text: "May 23, 2012"
      dates_text: "1985"
      description: null
      dimensions: {in:'20 1/10 × 15 9/10 in', cm:'51 × 40 1/2 cm'}
      estimate_text: "€120,000 - 160,000"
      external_url: "http://www.lempertz-online.de/gldet_gb.asp?v=k1026400009980073900011&mkat=0&mablos=737&msb=&martist=0"
      id: _.uniqueId()
      image_url: "http://static1.artsy.net/auction_lots/51d041844c91c616610005a0/thumbnail.jpg"
      image_versions: ['thumbnail']
      medium_text: "Screenprint on canvas"
      organization: "Lempertz"
      price_realized_text: "€140,300"
      title: "MADONNA PAINTING"

    when 'video'
      id: _.uniqueId()
      original_height: 900
      original_width: 1600
      title: 'A day in the life of a cat'
      subtitle: 'Featuring Bitty the Cat'
      lr_video_url: "http://static.artsy.net/media/max_two_x_two_900"
      hr_video_url: "http://static.artsy.net/media/max_two_x_two_900"
      image_versions: ["large_rectangle","medium_rectangle","small_square","medium_square","large_square","large_cinematic"]
      image_url: '/local/videos/id/:version.jpg'

    when 'bidder_position'
      active: true
      bid_max: false
      created_at: "2013-11-14T00:03:27Z"
      highest_bid: null
      id: "5284134f8b3b81a906000003"
      max_bid_amount_cents: 310000
      suggested_next_bid_cents: 325000
      updated_at: "2013-11-14T00:03:27Z"

    when 'partner_location'
      id: _.uniqueId()
      name: 'Eli Ridgway'
      address: '172 Minna Street'
      address_2: ''
      city: 'San Francisco'
      country: 'United States'
      state: 'CA'
      postal_code: '94105'
      phone: '415-777-1366'
      coordinates: null
      position: 1
      email: 'info@eliridgway.com'
      fax: ''
      publicly_viewable: true
      day_schedules: [
        {
          _id: "5543d893726169750b990100",
          start_time: 36000,
          end_time: 68400,
          day_of_week: "Sunday"
        }, {
          _id: "5543d8937261697591bd0100",
          start_time: 36000,
          end_time: 68400,
          day_of_week: "Monday"
        }, {
          _id: "5543d89472616978f1e40100",
          start_time: 36000,
          end_time: 68400,
          day_of_week: "Tuesday"
        }, {
          _id: "5543d8947261690f169d0100",
          start_time: 36000,
          end_time: 68400,
          day_of_week: "Wednesday"
        }, {
          _id: "5543d8947261695aea200200",
          start_time: 36000,
          end_time: 68400,
          day_of_week: "Thursday"
        }
      ]

    when 'partner_artist'
      id: _.uniqueId()
      image_versions: ["four_thirds", "four_thirds_retina", "square"]
      image_url: "/foo/bar/:version.jpg"
      represented_by: true
      display_on_partner_profile: true
      published_artworks_count: 7
      artist: fabricate 'artist',
        public: true
        published_artworks_count: 57
        forsale_artworks_count: 40
        artworks_count: 122
        blurb: undefined
      partner: fabricate 'partner'

    when 'fair_event_group'
      fair: fabricate 'fair'
      id: _.uniqueId()
      name: 'The China Symposium'
      description: "\nOrganized by Philip Tinari\nMarch 8-9, 2014\n\nFor the first time, The Armory Show will host a symposium in conjunction with its annual regional Focus initiative. Organized by Philip Tinari, Director of the Ullens Center for Contemporary Art, Beijing, this inaugural weekend-long forum comprises eight discussions that aim to elaborate and clarify the state of contemporary art in China today."
      updated_at: "2014-02-24T16:34:25Z"

    when 'fair_event'
      id: _.uniqueId()
      fair: fabricate 'fair'
      fair_event_groups: [ fabricate('fair_event_group') ]
      name: "Welcome"
      description: "PARTICIPANTS: Noah Horowitz, Executive Director, The Armory Show\nPhilip Tinari, Director, Ullens Center for Contemporary Art (UCCA), Beijing\nAdrian Cheng, Founder and Chairman, K11 Art Foundation, Hong Kong\n"
      extended_description: "This panel is organized in conjunction with The Armory Show – Modern exhibition, VENUS DRAWN OUT: 20th Century Works by Great Women Artists on Pier 92, and will feature a rare conversation amongst several of its participants.  The panelists will discuss their nuanced artistic practices, works of art on view at the fair, alongside broader topics such as the context of working as a female artist and the field of twentieth century Modern Art as a whole\n\nFeaturing panelists: Inka Essenhigh, Artist, New York; Lynn Gumpert, Director, Grey Art Gallery, New York University; Pat Steir, Artist, New York. Moderated by Susan Harris, New York-based Independent Curator and Writer."
      venue: "T: The New York Times Style Magazine Media Lounge on Pier 94"
      start_at: "2014-03-08T17:15:00+00:00"
      end_at: "2014-03-08T17:30:00+00:00"
      updated_at: "2014-02-24T16:34:25Z"

    when 'show_event'
      _id: _.uniqueId()
      partner_show: fabricate 'show'
      title: ""
      start_at: "2012-02-09T18:00:00+00:00"
      end_at: "2012-02-09T20:00:00+00:00"
      description: ""
      event_type: "Opening Reception"

    when 'artist_filtered_search_suggest'
      total: 79
      related_gene: {}
      medium:
        design:
          name: "Design"
          count: 2
        drawing:
          name: "Drawing"
          count: 10
        painting:
          name: "Painting"
          count: 7
        prints:
          name: "Prints"
          count: 8
        sculpture:
          name: "Sculpture"
          count: 32
        "work-on-paper":
          name: "Work On Paper"
          count: 44
      dimension:
        96:
          name: "96"
          count: 76
      gallery:
        "barbara-krakow-gallery":
          name: "Barbara Krakow Gallery"
          count: 3
        "carolina-nitsch-contemporary-art":
          name: "Carolina Nitsch Contemporary Art"
          count: 17
        caviar20:
          name: "Caviar20"
          count: 2
        "cheim-and-read":
          name: "Cheim & Read"
          count: 28
        "peter-blum-gallery":
          name: "Peter Blum Gallery"
          count: 4
        "robert-miller-gallery":
          name: "Robert Miller Gallery"
          count: 2
        "senior-and-shopmaker-gallery":
          name: "Senior & Shopmaker Gallery"
          count: 3
        "xavier-hufkens":
          name: "Xavier Hufkens"
          count: 3
      institution:
        "miniature-museum-ria-and-lex-daniels":
          name: "Miniature Museum Ria and Lex Daniels"
          count: 1
        "museum-of-arts-and-design":
          name: "Museum of Arts and Design"
          count: 1
        "serpentine-gallery":
          name: "Serpentine Gallery"
          count: 1
        "whitechapel-gallery":
          name: "Whitechapel Gallery"
          count: 1
      period:
        1940:
          name: "1940s"
          count: 5
        1950:
          name: "1950s"
          count: 1
        1960:
          name: "1960s"
          count: 9
        1970:
          name: "1970s"
          count: 1
        1980:
          name: "1980s"
          count: 3
        1990:
          name: "1990s"
          count: 22
        2000:
          name: "2000s"
          count: 32
        2010:
          name: "2010s"
          count: 3
      sale_status: {}
      price_range:
        "-1:1000000000000":
          name: "-1:1000000000000"
          count: 74

    when 'article'
      {
        "author": {
          "id": "503f86e462d56000020002cc",
          "name": "Artsy Editorial",
          "profile_id": "5086df078523e60002000009",
          "profile_handle": "editorial"
        },
        "author_id": "503f86e462d56000020002cc",
        "fair_id": null,
        "featured": true,
        "featured_artist_ids": [
          "4d9b330cff9a375c2f0031a8"
        ],
        "featured_artwork_ids": [
          "541c4d3f7261692d70560000",
          "5400a15e7261692d67530000",
          "541c4d3f72616929e50e0600",
          "541c4d3f7261692d91750000",
          "541c4d3f7261692d84ba0000"
        ],
        "gravity_id": "542334267261692d6e590700",
        "migrated_from_gravity": true,
        "partner_ids": [
          "4d8b92c44eb68a1b2c0004cb"
        ],
        "published": true,
        "published_at": "2014-09-24T23:24:54.000Z",
        "sections": [
          {
            "type": "image",
            "url": "https://artsy-media-uploads.s3.amazonaws.com/9-vuUwfMbo9-dibbqjZQHQ%2FSterling_Ruby_2013_%282%29.jpg",
            "caption": "<p>Sterling Ruby, Los Angeles, 2013. Photo by CG Watkins. Courtesy Sterling Ruby Studio and Gagosian Gallery</p>"
          },
          {
            "type": "text",
            "body": "<p>Take a look at one of&nbsp;<a href=\"https://artsy.net/artist/sterling-ruby\">Sterling Ruby</a>’s fluorescent spray paintings and it will likely make you see something else. In the hazy horizontal stripes of color, from grays and blacks to rose pink and emerald green, one might see a cross section of muscle or skeletal tissue under a microscope; the surface of an extraterrestrial planet; a broken television humming with static; or maybe just a Color Field painting. The inspiration behind these works, however, lies elsewhere—literally, on the horizon. The new suite of spray paintings that collectively form the exhibition “<a href=\"https://artsy.net/show/gagosian-gallery-sterling-ruby-vivids\">VIVIDS</a>,” at&nbsp;<a href=\"https://artsy.net/gagosian-gallery\">Gagosian Gallery</a>’s Hong Kong space, were inspired by the sky, particularly the smoggy Los Angeles sky that engulfs Ruby each day, as he drives into and out of the Downtown area where his studio is housed. For the artist, the daily commute has become a ritual; a recurring journey through which he has witnessed countless sunrises and sunsets, beckoning hours on end of contemplation. The resulting abstractions are intriguing, fresh compositions that transcend any particular geographic or cultural lexicon, making them especially fitting for the Hong Kong space. These glowing beacons, lined up along the walls of the stark white Pedder Building, look out onto a new horizon, and across the Asian continent at this moment, several other simultaneous exhibitions of Ruby’s works do the same.</p>"
          },
          {
            "type": "image",
            "url": "https://artsy-media-uploads.s3.amazonaws.com/OH0lVpFYr1YjJMTayxqVSw%2FSterling_Ruby_-_installation_09.jpg",
            "caption": "<p>“Sterling Ruby: VIVIDS” at Gagosian Gallery, Hong Kong. Photos by Calvin Sit. © Sterling Ruby Studio, Courtesy Sterling Ruby Studio and Gagosian Gallery</p>"
          },
          {
            "type": "artworks",
            "ids": [
              "5400a15e7261692d67530000",
              "541c4d3f7261692d91750000",
              "541c4d3f7261692d70560000"
            ],
            "layout": "overflow_fillwidth"
          },
          {
            "type": "text",
            "body": "<p>This wave of Asian shows comes on the heels of a vibrant spring season. In New York, three of Ruby’s giant ceramic dishes were featured in the&nbsp;<a href=\"https://artsy.net/feature/whitney-biennial-2014\">Whitney Biennial</a>, while his fluency in various mediums was on view in a giant solo show at Hauser &amp; Wirth, and, in June, Ruby sent an expansive installation of soft sculptures to&nbsp;<a href=\"https://artsy.net/art-basel\">Art Basel</a>&nbsp;for its Unlimited sector. This fall is no different: his works have surfaced in major shows in L.A. and New York (in LACMA’s “Variations: Conversations In and Around Abstract Painting” and Venus Over Manhattan’s “FIRE!” curated by&nbsp;<a href=\"https://artsy.net/simondepury\">Simon de Pury</a>); however, more extensive presentations of his works can be found in Hong Kong, Beijing, Tokyo, Taipei, and Gwangju—take your pick.</p>"
          },
          {
            "type": "image",
            "url": "https://artsy-media-uploads.s3.amazonaws.com/a2jvzxBrRFG_Bk-tss1kWw%2FInstallation_shot_Sterling_Ruby_%282%29.JPG",
            "caption": "<p>Installation view of&nbsp;“The Los Angeles Project” at Ullens Center for Contemporary Art, Beijing. Courtesy UCCA</p>"
          },
          {
            "type": "image",
            "url": "https://artsy-media-uploads.s3.amazonaws.com/7v_VrQo5ydLiE0mMLG8FAA%2FInstallation_shot_Sterling_Ruby.JPG",
            "caption": "<p>Installation view of&nbsp;“The Los Angeles Project” at Ullens Center for Contemporary Art, Beijing. Courtesy UCCA</p>"
          },
          {
            "type": "text",
            "body": "<p>While he’s shown throughout Asia before, this latest proliferation of exhibitions marks an exciting moment to consider the artist outside of the far-reaching Western art world. In addition to “VIVIDS,” his first solo show in Hong Kong, Ruby is featured at Beijing’s&nbsp;<a href=\"https://artsy.net/ucca\">Ullens Center for Contemporary Art</a>&nbsp;in “The Los Angeles Project,” an exhibition focused on seven Los Angeles artists and their city—<a href=\"http://ucca.org.cn/en/exhibition/los-angeles-project/\">described</a>&nbsp;by UCCA as “one of the most important art centers in the Western world.” In Ruby’s solo show within the exhibition, his unique spin on tenets of Minimalism is manifested through a 30-meter-long cycle of spray paintings, a grouping of 2D collage works, and a work from his “Monumental Stalagmite” series—a giant horizontal pillar made from drips of urethane. The show, a spirited slice of the artist’s recent practice, is testament to non-Western interest in Ruby and his generation in L.A., and speaks to his current ubiquity across the continent.</p>"
          },
          {
            "type": "image",
            "url": "https://artsy-media-uploads.s3.amazonaws.com/y_LxshSm4vhcxSEoX1l6lw%2FSterling_Ruby_%281%29.jpg",
            "caption": "<p>Installation view,&nbsp;Taipei Biennial 2015. Courtesy Taipei Biennial.&nbsp;</p>"
          },
          {
            "type": "image",
            "url": "https://artsy-media-uploads.s3.amazonaws.com/0sgRZG_yDlu1LEd_EGxvHA%2FSterling_Ruby_%284%29_%281%29.jpg",
            "caption": "<p>Installation&nbsp;view,&nbsp;Taipei Biennial&nbsp;2015. Courtesy Taipei Biennial.&nbsp;</p>"
          },
          {
            "type": "text",
            "body": "<p>Ruby also debuted works in both the&nbsp;<a href=\"https://artsy.net/gwangju-biennale\">Gwangju Biennale</a>&nbsp;and the Taipei Biennial this September. For the Gwangju Biennale, Ruby fabricated five towering, functional stoves that were lit during the opening ceremonies. Meanwhile, at the Tapei Biennial under the curation of Nicolas Bourriaud, he presents 35 collage works that combine painting, drawing, and print techniques, displaying his dialogue with material and responding to the Biennial’s overall theme, the impact of human life on the earth and its atmosphere—an especially relevant prompt given Ruby’s marked interest in the cosmos and existentialism. His works fills three gallery walls, transitioning from the artist’s classic use of neons, works splattered with nail polish, and collaged photographs and cardboard that incorporate planetary imagery.</p>"
          },
          {
            "type": "artworks",
            "ids": [
              "541c4d3f7261692d84ba0000",
              "541c4d3f72616929e50e0600"
            ],
            "layout": "overflow_fillwidth"
          },
          {
            "type": "text",
            "body": "<p>Back in Hong Kong, “VIVIDS” exemplifies Ruby’s ability to transform the traditionally gritty implications behind spray paint and graffiti culture into tranquil, mesmerizing contemplations of color and material. “The desire to make paintings was an absolute reaction to seeing graffiti and territorial disputes writ large in the streets, almost as if a case study,” Ruby recently&nbsp;<a href=\"http://www.gagosian.com/now/qa--sterling-ruby\">said in an interview</a>. “I found it almost impossible to ignore my generation’s continued struggle to find ways to make a meaningful painting.” These new works, responses to the radiant sky and the kaleidoscope of colors it generates as the sun drifts into and out of the horizon, are born from a universal phenomenon, and nod to the human fixation on beginnings and endings. By connecting “VIVIDS” to his city, where a notorious layer of smog directly affects perception of the sky’s range of color, he circles back to the Taipei Biennial’s theme, considering man’s impact on the planet. Distilling omnipresent human experiences in this way, and employing choice materials and colors, Ruby ensures an appeal that transcends the distinctions of East and West.</p>"
          },
          {
            "type": "text",
            "body": "<p>—<a href=\"https://artsy.net/calesser\">Casey Lesser</a><br></p><p><i>“<a href=\"https://artsy.net/show/gagosian-gallery-sterling-ruby-vivids\">Sterling Ruby: VIVIDS</a>” is\\\non view at </i><a href=\"https://artsy.net/gagosian-gallery\"><i>Gagosian</i></a><i>, Hong Kong, Sept. 13th–Oct. 25th, 2014.</i>&nbsp;</p><p><i>See more of Ruby’s works at\\\nthe </i><a href=\"https://artsy.net/gwangju-biennale\"><i>Gwangju\\\nBiennale</i></a><i>, Sept.\\\n5th–Nov. 9th, 2014; Taipei Biennial Sept. 13th, 2014–Jan. 4th, 2015; and “The\\\nLos Angeles Project” at </i><a href=\"https://artsy.net/ucca\"><i>Ullens\\\nCenter for Contemporary Art</i></a><i>, Beijing, Sept. 13th–Nov. 9th, 2014.</i></p>"
          }
        ],
        "thumbnail_image": "https://d1ycxz9plii3tb.cloudfront.net/post_images/542350797261695b49510000/large.jpg",
        "thumbnail_teaser": "Take a look at one of Sterling Ruby’s fluorescent spray paintings and it will\\\nlikely make you see something else. In the hazy horizontal stripes of color,\\\nfrom grays and blacks to rose pink and emerald green, one might see a cross\\\nsection of muscle or skeletal tissue under a microscope; the surface of an\\\nextraterrestrial planet; a broken television humming with static; or maybe just\\\na Color Field painting. The inspiration behind these works, however, lies\\\nelsewhere—literally, on the horizon. The new suite of spray paintings that\\\ncollectively form the exhibition “VIVIDS,” at Gagosian Gallery’s Hong Kong space, were inspired by the sky,\\\nparticularly the smoggy Los Angeles sky that engulfs Ruby each day, as he\\\ndrives into and out of the Downtown area where his studio is housed. For the\\\nartist, the daily commute has become a ritual; a recurring journey through\\\nwhich he has witnessed countless sunrises and sunsets, beckoning hours on end\\\nof contemplation. The resulting abstractions are intriguing, fresh compositions\\\nthat transcend any particular geographic or cultural lexicon, making them\\\nespecially fitting for the Hong Kong space. These glowing beacons, lined up\\\nalong the walls of the stark white Pedder Building, look out onto a new\\\nhorizon, and across the Asian continent at this moment, several other\\\nsimultaneous exhibitions of Ruby’s works do the same.",
        "thumbnail_title": "On The Heels of A Stellar Year in the West, Sterling Ruby Makes His Vivid Mark on Asia",
        "tier": 2,
        "title": "On The Heels of A Stellar Year in the West, Sterling Ruby Makes His Vivid Mark on Asia",
        "updated_at": "2015-05-22T18:47:19.033Z",
        "slug": "editorial-on-the-heels-of-a-stellar-year",
        "tags": [],
        "lead_paragraph": "<p><br></p>",
        "hero_section": null,
        "vertical_id": null,
        "auction_id": null,
        "show_ids": null,
        "primary_featured_artist_ids": null,
        "contributing_authors": [],
        "is_super_article": false,
        "id": _.uniqueId()
      }

  , extObj
