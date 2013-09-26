# 
# A function that helps create fixture data modeled after the Gravity API.
# Pass in the name of the model and any extending data and it'll return
# a vanilla javascript object populated with fixture json data.
# 
# e.g. `fabricate('artwork', { title: 'Three Wolf Moon'` })
# 
# TODO: Find a good way to share this between intertia/torque/microgravity
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
        in: '10 x 20 x 30in'
        cm: '100 x 200 x 40cm'
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

    when 'edition_set'
      id: '34f4wawe' + _.uniqueId()
      editions: '1,2,3 of 10'
      dimensions:
        in: '10 x 20 x 30in'
        cm: '100 x 200 x 40cm'
      metric: 'in'

    when 'partner'
      id: 'gagosian' + _.uniqueId()
      name: 'Gagosian Gallery'
      admin: fabricate 'user'
      representations: []

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
      image_versions: [ 'small_square' ]
      item_type: 'FeaturedLink'

    when 'user'
      id: 'foobar' + _.uniqueId()
      name: 'Craig Spaeth'
      website: null
      email: 'craigspaeth@gmail.com'
      type: 'User'
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
      id: "someone-puts-a-pineapple-together" + _.uniqueId()
      artworks_count: 6
      end_at: "2012-02-04T11:00:00-05:00"
      name: "Someone Puts a Pineapple Together"
      start_at: "2012-01-07T11:00:00-05:00"
      image_url: "/local/partner_shows/id/:version.jpg"
      image_versions: ['four_thirds', 'square', 'four_thirds_retina']
      partner: fabricate 'partner'
      
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
      id: "abstract-expressionism" + _.uniqueId()
      name: "Abstract Expressionism"
      counts: {artworks: 5, artists: 10}

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
      
    when 'order_line_item'
      id: _.uniqueId()
      artwork: fabricate 'artwork'
      quantity: 1

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
      organizer:
        profile_id: 'the-armory-show'
        name: 'Armory Show' 

    when 'sale'
      id: "whtney-art-party"
      name: 'Whitney Art Party'
      description: "This is a great party"

    when 'feature'
      id: "bitty-the-cat"
      name: 'A Feature all about the greatest cat'
      description: "This is a great cat, the best."
      image_url: 'foo/bar/:version.jpg'

    when 'set'
      id: _.uniqueId()
      key: 'homepage:featured'
      item_type: 'FeaturedLink'

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
    
  , extObj