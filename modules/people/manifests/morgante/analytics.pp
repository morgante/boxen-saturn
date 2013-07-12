class people::morgante::analytics inherits people::morgante {    
    
    notify { "loading analytics": }
    
    # Include StatsD
    include "statsd"
    
    statsd::config::port = 5
}