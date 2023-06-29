import pygame

def start():
    pygame.init()
    AppTitle = "Hello Window"
    screen = pygame.display.set_mode((400,300))
    pygame.display.set_caption(AppTitle)
    clock = pygame.time.Clock()
    running = True
    clearCOLOR = (0xff,0,0)


    while running:
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                running = False
        screen.fill(clearCOLOR)
        pygame.display.update()
        clock.tick(60)
    pygame.quit()

start()