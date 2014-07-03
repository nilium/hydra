#import "lua/lauxlib.h"
#import <Cocoa/Cocoa.h>

void hydra_push_nspoint(lua_State *L, NSPoint point);
NSPoint hydra_to_nspoint(lua_State *L, int index);

void hydra_push_nssize(lua_State *L, NSSize size);
NSSize hydra_to_nssize(lua_State *L, int index);

void hydra_push_nsrect(lua_State *L, NSRect rect);
NSRect hydra_to_nsrect(lua_State *L, int index);
