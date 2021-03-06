class @Water
  NUM_TITLES: 32
  TILE_SIZE: 16

  constructor: (x, y) ->
    @id = "water-#{uuid.v4()}"

    texture = PIXI.Texture.fromFrame("water.png");
    @sprite = new PIXI.Sprite(texture)
    @sprite.position.x = x
    @sprite.position.y = y
    waterContainer.addChild(@sprite)

    settings =
      id: @id,
      x:  @sprite.position.x + @TILE_SIZE / 2
      y:  @sprite.position.y + @TILE_SIZE / 2
      halfHeight: @TILE_SIZE / 2
      halfWidth:  @TILE_SIZE / 2
      dampen: 0
      angle:  0
      type:   'static'
      categories:   ['static']
      collidesWith: ['player']
      userData:
        id: @id
        type: 'water'

    @body = Physics.createBody(settings)
    Physics.bodies[@id] = @
