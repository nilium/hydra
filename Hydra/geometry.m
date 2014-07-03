#import "helpers.h"
#import "geom_util.h"

static hydradoc doc_geometry_intersectionrect = {
    "geometry", "intersectionrect", "geometry.intersectionrect(rect1, rect2) -> rect3",
    "Returns the intersection of two rects as a new rect."
};

int geometry_intersectionrect(lua_State* L) {
    NSRect lhs = hydra_to_nsrect(L, 1);
    NSRect rhs = hydra_to_nsrect(L, 2);
    NSRect result = NSIntersectionRect(lhs, rhs);
    
    hydra_push_nsrect(L, result);
    
    return 1;
}

static const luaL_Reg geometrylib[] = {
    {"intersectionrect", geometry_intersectionrect},
    {NULL, NULL}
};

int luaopen_geometry(lua_State* L) {
    hydra_add_doc_group(L, "geometry", "Mathy stuff.");
    hydra_add_doc_item(L, &doc_geometry_intersectionrect);
    
    luaL_newlib(L, geometrylib);
    return 1;
}
