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

    when 'profile'
      id: "5086df098523e60002000012"
      created_at: "2012-10-23T18:16:41+00:00"
      updated_at: "2014-09-24T20:38:41+00:00"
      handle: "craig"
      location: "New York, New York"
      description: "Developer at Artsy. My heart swoons for code, art, & indie games."
      _links:
        curies: [
          name: "image"
          href: "http://stagic3.artsy.net/profile_icons/504e2c4fbb39040002000483/{?rel}"
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