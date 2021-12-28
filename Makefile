CXXFLAGS :=-g -std=c++11 -DPLATFORM_SCREEN_WIDTH=3128 -DPLATFORM_SCREEN_HEIGHT=1568 -DPLATFORM_MAP_WINDOW_TILES_WIDTH=128 -DPLATFORM_MAP_WINDOW_TILES_HEIGHT=64 -DPLATFORM_TILE_BASED_RENDERING -DPLATFORM_IMAGE_BASED_TILES -DPLATFORM_IMAGE_SUPPORT -DPLATFORM_SPRITE_SUPPORT -DPLATFORM_COLOR_SUPPORT -DOPTIMIZED_MAP_RENDERING
LDFLAGS :=

CXXFLAGS += `pkg-config --cflags sdl2`
CXXFLAGS += `pkg-config --cflags SDL2_image`
LDFLAGS += `pkg-config --libs sdl2`
LDFLAGS += `pkg-config --libs SDL2_image`

SOURCES := petrobots.cpp Platform.cpp PlatformSDL.cpp
OBJECTS := $(SOURCES:.cpp=.o)
TARGET := petrobots

all: $(TARGET)

.cpp.o:
	$(CXX) $(CXXFLAGS) -c -o $@ $<

$(TARGET): $(OBJECTS)
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LDFLAGS)

clean:
	rm -f $(OBJECTS) $(TARGET)
