// Original by:
// Copyright anssi.grohn@karelia.fi (c) 2014.
// Licensed under GPLv3.
// Modified by:
// Tommi.Karki@edu.karelia.fi
#include "Game.h"
#include <iostream>
#include <string>
////////////////////////////////////////////////////////////////////////////////
// Load SDL stuff
#include <SDL.h>
#include <stdexcept>
////////////////////////////////////////////////////////////////////////////////
//
using namespace std;
////////////////////////////////////////////////////////////////////////////////
//
const int WINDOW_WIDTH = 640;
const int WINDOW_HEIGHT = 400;
////////////////////////////////////////////////////////////////////////////////
int main( int argc, char **argv )
{
	// Init EVERYTHING
	if( SDL_Init( SDL_INIT_EVERYTHING ) < 0 )
		throw runtime_error( SDL_GetError());

	// Make window to draw stuff on
	SDL_Window *pScreen = SDL_CreateWindow( "Module1", 0, 0,
										WINDOW_WIDTH, WINDOW_HEIGHT,
										SDL_WINDOW_SHOWN );
	if ( pScreen == NULL )
		throw runtime_error( SDL_GetError());

	// Init renderer
	SDL_Renderer * renderer = SDL_CreateRenderer(pScreen, -1, SDL_RENDERER_ACCELERATED | SDL_RENDERER_PRESENTVSYNC);
	// And surface for processing
	SDL_Surface * surface = SDL_LoadBMP("./res/splash.bmp");
	if( surface == NULL )
		throw runtime_error( SDL_GetError());

	// Finally make texture from the surface
	SDL_Texture *texture = SDL_CreateTextureFromSurface( renderer, surface );
	// Clear window to be safe
	SDL_RenderClear(renderer);
	// Draw image to gpu and screen
	SDL_RenderCopy(renderer, texture, NULL, NULL);
	SDL_RenderPresent(renderer);
	SDL_Delay(4000);
	SDL_Quit();
	// Ignore game for now
  	//Game & g = *Game::GetInstance();
  	//g.Play();

  return 0;
}
////////////////////////////////////////////////////////////////////////////////
