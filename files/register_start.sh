#!/bin/bash
HOST=$(hostname -i)
HOSTNAME=$(hostname)
curl -s -XPUT consul:8500/v1/agent/service/register -d "{
   \"ID\": \"$HOSTNAME\",
   \"Name\":\"webservers\",
   \"Port\": 8080,        
   \"tags\": [\"$HOST\"],  
   \"Address\": \"$HOST\",
   \"Check\": {           
     \"HTTP\": \"http://$HOST/nginx-health\",
     \"interval\": \"15s\"                      
  }                                             
}"


