module WcnScraper
  class Location
    attr_reader :lat, :lng

    # This list was generated from bin/geocode-prisons.rb plus a bit
    # of post-processing in vim.
    PRISON_LOCATIONS = [
      { prison: "HMP Berwyn", lat: 53.036418, lng: -2.9292142 },
      { prison: "HMP Brixton", lat: 51.4516617, lng: -0.1250917 },
      { prison: "HMP Bure", lat: 52.759454, lng: 1.3458199 },
      { prison: "HMP Cardiff", lat: 51.4810689, lng: -3.1683326 },
      { prison: "HMP Channings Wood", lat: 50.5104924, lng: -3.6518204 },
      { prison: "HMP Chelmsford", lat: 51.7361324, lng: 0.4860732999999999 },
      { prison: "HMP Coldingley", lat: 51.3217467, lng: -0.6432669 },
      { prison: "HMP Dartmoor", lat: 50.5495271, lng: -3.9963275 },
      { prison: "HMP Eastwood Park", lat: 51.63504709999999, lng: -2.468383 },
      { prison: "HMP Erlestoke", lat: 51.2833485, lng: -2.0430271 },
      { prison: "HMP Featherstone", lat: 52.6473483, lng: -2.1098351 },
      { prison: "HMP Grendon", lat: 51.8931365, lng: -1.0072932 },
      { prison: "HMP Guys Marsh", lat: 50.9847775, lng: -2.2215698 },
      { prison: "HMP Haverigg", lat: 54.2022592, lng: -3.3125602 },
      { prison: "HMP Hewell", lat: 52.3246695, lng: -1.9870964 },
      { prison: "HMP High Down", lat: 51.3357233, lng: -0.1890383 },
      { prison: "HMP Highpoint", lat: 52.136974, lng: 0.510659 },
      { prison: "HMP Hollesley Bay", lat: 52.051042, lng: 1.451328 },
      { prison: "HMP Humber", lat: 53.7693399, lng: -0.6410579 },
      { prison: "HMP Huntercombe", lat: 51.5874, lng: -1.0183 },
      { prison: "HMP Kirkham", lat: 53.774924, lng: -2.8731828 },
      { prison: "HMP Leicester", lat: 52.6274509, lng: -1.131901 },
      { prison: "HMP Leyhill", lat: 51.62803419999999, lng: -2.4367766 },
      { prison: "HMP Lincoln and IRC Morton Hall", lat: 53.1679042, lng: -0.6890860999999999 },
      { prison: "HMP Littlehey", lat: 52.2805913, lng: -0.3122374 },
      { prison: "HMP Long Lartin", lat: 52.108459, lng: -1.8540072 },
      { prison: "HMP Low Newton", lat: 54.8064867, lng: -1.549427 },
      { prison: "HMP Maidstone", lat: 51.2793606, lng: 0.5237286 },
      { prison: "HMP Norwich", lat: 52.6369762, lng: 1.3179051 },
      { prison: "HMP Onley", lat: 52.3269943, lng: -1.2465741 },
      { prison: "HMP Ranby", lat: 53.3200826, lng: -0.9961172 },
      { prison: "HMP Stocken", lat: 52.7469327, lng: -0.5821626999999999 },
      { prison: "HMP Swaleside", lat: 51.3929227, lng: 0.8536864000000001 },
      { prison: "HMP The Mount", lat: 51.72473859999999, lng: -0.5410677 },
      { prison: "HMP Usk/Prescoed", lat: 51.6856926, lng: -2.9414967 },
      { prison: "HMP Wandsworth", lat: 51.4500051, lng: -0.1775711 },
      { prison: "HMP Wayland", lat: 52.5538889, lng: 0.8580555999999999 },
      { prison: "HMP Whatton", lat: 52.9472902, lng: -0.9116372 },
      { prison: "HMP Whitemoor", lat: 52.57534589999999, lng: 0.0811047 },
      { prison: "HMP Winchester", lat: 51.0625986, lng: -1.3279811 },
      { prison: "HMP Woodhill", lat: 52.0143898, lng: -0.8083142 },
      { prison: "HMP/YOI Bedford", lat: 52.1389661, lng: -0.4696008999999999 },
      { prison: "HMP/YOI Downview", lat: 51.3384631, lng: -0.1880442 },
      { prison: "HMP/YOI Drake Hall", lat: 52.87726, lng: -2.2425361 },
      { prison: "HMP/YOI Foston Hall", lat: 52.8822614, lng: -1.7253463 },
      { prison: "HMP/YOI Isis", lat: 51.4976997, lng: 0.09784160000000001 },
      { prison: "HMP/YOI Isle of Wight", lat: 50.713196, lng: -1.3076464 },
      { prison: "HMP/YOI Lewes", lat: 50.8722285, lng: -0.005117099999999999 },
      { prison: "HMP/YOI Send", lat: 51.2716941, lng: -0.4908906 },
      { prison: "HMP/YOI Wormwood Scrubs", lat: 51.5169637, lng: -0.2403418 },
      { prison: "HMYOI Aylesbury", lat: 51.8225809, lng: -0.8016525999999999 },
      { prison: "HMYOI Cookham Wood", lat: 51.3663986, lng: 0.4942465 },
      { prison: "HMYOI Deerbolt", lat: 54.5432115, lng: -1.9367631 },
      { prison: "HMYOI Feltham", lat: 51.4415566, lng: -0.4340565 },
      { prison: "HMYOI Portland & IRC Verne", lat: 50.5497794, lng: -2.4219912 },
      { prison: "HMYOI Stoke Heath", lat: 52.8688371, lng: -2.5218096 },
      { prison: "HMYOI Swinfen Hall", lat: 52.6525736, lng: -1.8066018 }
    ]

    def initialize(prison)
      coords = locate(prison)
      @lat = coords.fetch(:lat)
      @lng = coords.fetch(:lng)
    end

    private

    def locate(prison)
      p = PRISON_LOCATIONS.find {|loc| loc.fetch(:prison) == prison}

      {
        lat: p.fetch(:lat),
        lng: p.fetch(:lng)
      }
    end

  end
end
