$ ->

  waitForMap ->

    coordinates = [55.756, 37.647]

    #http://geocode-maps.yandex.ru/1.x/?geocode=OLOLOLO
    @map = new ymaps.Map($("#map")[0], {center: coordinates, zoom: 17})

    balloonLayout = ymaps.templateLayoutFactory.createClass('$[properties.content]')
    ymaps.layout.storage.add('place#balloonLayout', balloonLayout)

    placemark = new ymaps.Placemark(
      coordinates,
    {
      content: $("#balloon-template").html()
    },
    {
      balloonAutoPan: false,
      hideIconOnBalloonOpen: true,
      balloonShadow: false,
      balloonLayout: "place#balloonLayout",
      iconImageSize: [32, 32],
      iconImageOffset: [-20, -30]
    }
    )

    @map.geoObjects.add placemark

    placemark.balloon.open()



window.waitForMap = (callback) ->
  if ymaps.Map
    callback(this)
  else
    setTimeout(
      ->
        waitForMap(callback)
      500
    )