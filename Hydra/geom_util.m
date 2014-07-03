#import "geom_util.h"


static void hydra_set_point(lua_State *L, int index, NSPoint point)
{
    index = lua_absindex(L, index);

    lua_pushnumber(L, point.x);
    lua_setfield(L, index, "x");

    lua_pushnumber(L, point.y);
    lua_setfield(L, index, "y");
}


static void hydra_set_size(lua_State *L, int index, NSSize size)
{
    index = lua_absindex(L, index);

    lua_pushnumber(L, size.width);
    lua_setfield(L, index, "w");

    lua_pushnumber(L, size.height);
    lua_setfield(L, index, "h");
}


static void hydra_get_point(lua_State *L, int index, NSPoint *point)
{
    index = lua_absindex(L, index);

    lua_getfield(L, index, "x");
    point->x = (CGFloat)lua_tonumber(L, -1);
    lua_pop(L, 1);

    lua_getfield(L, index, "y");
    point->y = (CGFloat)lua_tonumber(L, -1);
    lua_pop(L, 1);
}


static void hydra_get_size(lua_State *L, int index, NSSize *size)
{
    index = lua_absindex(L, index);

    lua_getfield(L, index, "w");
    size->width = (CGFloat)lua_tonumber(L, -1);
    lua_pop(L, 1);

    lua_getfield(L, index, "h");
    size->height = (CGFloat)lua_tonumber(L, -1);
    lua_pop(L, 1);
}


void hydra_push_nspoint(lua_State *L, NSPoint point)
{
    lua_createtable(L, 0, 2);
    hydra_set_point(L, -1, point);
}


NSPoint hydra_to_nspoint(lua_State *L, int index)
{
    NSPoint result;
    hydra_get_point(L, index, &result);
    return result;
}


void hydra_push_nssize(lua_State *L, NSSize size)
{
    lua_createtable(L, 0, 2);
    hydra_set_size(L, -1, size);
}


NSSize hydra_to_nssize(lua_State *L, int index)
{
    NSSize result;
    hydra_get_size(L, index, &result);
    return result;
}


void hydra_push_nsrect(lua_State *L, NSRect rect)
{
    lua_createtable(L, 0, 4);
    int table_index = lua_absindex(L, -2);

    hydra_set_point(L, table_index, rect.origin);
    hydra_set_size(L, table_index, rect.size);
}


NSRect hydra_to_nsrect(lua_State *L, int index)
{
    NSRect result;

    index = lua_absindex(L, index);

    hydra_get_point(L, index, &result.origin);
    hydra_get_size(L, index, &result.size);

    return result;
}
