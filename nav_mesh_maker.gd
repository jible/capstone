extends NavigationRegion2D
class_name NavMeshMaker

func make_mesh(corners):
	# James: After a bunch of fighting this, I just coppied some code from ball game
	var polygon = NavigationPolygon.new()
	polygon.add_outline(corners)
	polygon.agent_radius = 50
	polygon.source_geometry_group_name = "pathfinder_collision"
	polygon.source_geometry_mode = NavigationPolygon.SOURCE_GEOMETRY_GROUPS_EXPLICIT
	NavigationServer2D.bake_from_source_geometry_data(polygon, NavigationMeshSourceGeometryData2D.new());
	navigation_polygon = polygon	
	bake_navigation_polygon()
