extends NavigationRegion2D
class_name NavMeshMaker

func make_mesh(corners):
	# James: Copied this from a personal project- https://github.com/jible/BallGame/blob/main/Scripts/TileMapPackage.gd
	# The repo may be set to private
	var polygon = NavigationPolygon.new()
	polygon.add_outline(corners)
	polygon.agent_radius = 50
	polygon.source_geometry_group_name = "pathfinder_collision"
	polygon.source_geometry_mode = NavigationPolygon.SOURCE_GEOMETRY_GROUPS_EXPLICIT
	NavigationServer2D.bake_from_source_geometry_data(polygon, NavigationMeshSourceGeometryData2D.new());
	navigation_polygon = polygon	
	bake_navigation_polygon()
