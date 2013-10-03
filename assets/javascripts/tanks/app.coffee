# setup global objects here and create the global variables like world or
# renderer
Setup()

# our entry point to the game
@game = new Game()
@game.initialize()

animate = =>
  requestAnimFrame(animate)
  @game.update()
  @game.draw()
  
  # world.DrawDebugData();
  world.Step(1 / 60, 10, 10);
  world.ClearForces();
  
  renderer.render(stage)

requestAnimFrame(animate)

