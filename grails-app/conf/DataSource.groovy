dataSource {
    pooled = true
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
environments {
    development {
        dataSource {
			driverClassName = "org.hsqldb.jdbcDriver"
			username = "sa"
			password = ""
            dbCreate = "create-drop" // one of 'create', 'create-drop','update'
			url = "jdbc:hsqldb:mem:devDB"
        }
    }
    test {
        dataSource {
			driverClassName = "com.mysql.jdbc.Driver"
			username = "grails_app"
			password = "G3ge3tA&"
            dbCreate = "update"
			url = "jdbc:mysql://starplayersleague.com/spl_backup?autoreconnect=true"
            //url = "jdbc:hsqldb:mem:testDb"
        }
    }
    production {
        dataSource {
			driverClassName = "com.mysql.jdbc.Driver"
			username = "grails_app"
			password = "G3ge3tA&"
            dbCreate = "update"
			url = "jdbc:mysql://localhost/spl_production?autoreconnect=true"
            //url = "jdbc:hsqldb:file:prodDb;shutdown=true"
        }
    }
}
