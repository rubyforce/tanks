class @Tree
  NUM_TITLES: 32
  TILE_SIZE: 16

  constructor: (object, index) ->
    @id = "tree-#{uuid.v4()}"

    texture = PIXI.Texture.fromFrame("tree.png");
    @sprite = new PIXI.Sprite(texture)
    @sprite.position.x = Math.floor(index % @NUM_TITLES) * @TILE_SIZE - @TILE_SIZE / 2
    @sprite.position.y = Math.floor(index / @NUM_TITLES) * @TILE_SIZE - @TILE_SIZE / 2
    stage.addChild(@sprite)

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
      collidesWith: ['none']
      userData:
        id: @id
        type: 'tree'

    @body = Physics.createBody(settings)
    Physics.bodies[@id] = @
