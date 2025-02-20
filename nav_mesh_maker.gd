extends NavigationRegion2D
class_name NavMeshMaker

func make_mesh(corners):
	# TODO Find a way to manually modify the outter bounds of the navmesh.
	bake_navigation_polygon()
