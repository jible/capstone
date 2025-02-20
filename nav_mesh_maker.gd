extends NavigationRegion2D
class_name NavMeshMaker

# Make a nav mesh region bound within corners(arg)
# bake this area with the tile map in mind

func make_mesh(corners):
	var new_navigation_polygon = NavigationPolygon.new()
	var bounding_outline = corners
	new_navigation_polygon.add_outline(bounding_outline)
	NavigationServer2D.bake_from_source_geometry_data(new_navigation_polygon, NavigationMeshSourceGeometryData2D.new());
	
	navigation_polygon = new_navigation_polygon
	bake_navigation_polygon()
