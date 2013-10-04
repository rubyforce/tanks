class @Player
  width: 16
  height: 16

  constructor: (@x, @y, @way = 38, @is_moving = false) ->
    window.addEventListener 'keydown', (e) =>
      if [37, 38, 39, 40].indexOf(e.keyCode) isnt -1
        @way = e.keyCode
        @is_moving = true

    window.addEventListener 'keyup', (e) =>
      @is_moving = false

    @body = Physics.createBody(@width, @height, @x, @y)

  initialize: ->
    textures = [
      PIXI.Texture.fromFrame("yellow-tank-up.png"),
      PIXI.Texture.fromFrame("yellow-tank-bottom.png"),
      PIXI.Texture.fromFrame("yellow-tank-left.png"),
      PIXI.Texture.fromFrame("yellow-tank-right.png")
    ]
    @animation = new PIXI.MovieClip(textures)
    stage.addChild(@animation)

  update: ->
    return unless @is_moving

    if @way is 37 # LEFT
      @body.SetLinearVelocity(new b2Vec2(-1000, 0))
    if @way is 38 # UP
      @body.SetLinearVelocity(new b2Vec2(0, -1000))
    if @way is 39 # RIGHT
      @body.SetLinearVelocity(new b2Vec2(1000, 0))
    if @way is 40 # BOTTOM
      @body.SetLinearVelocity(new b2Vec2(0, 1000))

  draw: ->
    return unless @animation?

    position = @body.GetPosition()
    @animation.position.x = position.x
    @animation.position.y = position.y

    # play frame
    if @way is Keys.LEFT
      @animation.gotoAndPlay(1)
    if @way is Keys.UP
      @animation.gotoAndPlay(3)
    if @way is Keys.RIGHT
      @animation.gotoAndPlay(2)
    if @way is Keys.BOTTOM
      @animation.gotoAndPlay(0)

