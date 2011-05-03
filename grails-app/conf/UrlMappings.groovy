class UrlMappings {

	static mappings = {
		"/"(controller: "navigation", action: "welcome")
		"/info"(view:"/info")
		"/contact"(view:"/contact")
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}
		
		"/admin"(view:"/index")
		"500"(view:'/error')
	}
}
