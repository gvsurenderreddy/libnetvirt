#!/bin/bash
max=$1
min=$2
for num in $(seq $min 1 $max)
do

JSON=$(cat << SETVAR
{
        "kind": {
            "term": "CloNeNode",
            "scheme": "http://schemas.ogf.org/occi/ocni",
            "class": "kind"
        },
        "occi.core.id": "CloNeNode$num",
        "occi.core.title": "Clone node for libnetvirt",
        "occi.core.summary": "CloNeNode with libnetvirt mixin created by Daniel",
        "mixins": [
            {
                "term": "libnetvirt",
                "scheme": "http://schemas.ogf.org/occi/ocni",
                "class": "mixin"
            }
        ],
        "links": [],
        "attributes": {
            "ocni.clonenode.availability":[
                {
                    "ocni.availability.start":"08:00",
                    "ocni.availability.end":"12:30"
                },
                {
                    "ocni.availability.start":"14:00",
                    "ocni.availability.end":"18:00"
                }
            ],
            "ocni.clonenode.location": "EU",
            "ocni.clonenode.state": "active",
            "ocni.libnetvirt.uuid" : "$num",
            "ocni.libnetvirt.endpoint" : [
		{
	            "ocni.libnetvirt.endpoint.uuid" : "$num",
	            "ocni.libnetvirt.endpoint.swid" : "$num",
		    "ocni.libnetvirt.endpoint.port" : "1"
		},
		{
		    "ocni.libnetvirt.endpoint.uuid" : "$num",
		    "ocni.libnetvirt.endpoint.swid" : "$num",
		    "ocni.libnetvirt.endpoint.port" : "2"
		}
            ],
            "ocni.libnetvirt.of_controller" : "127.0.0.1",
            "ocni.libnetvirt.of_controller_port" : "2000",
            "ocni.libnetvirt.constraint" : []
        }
}
SETVAR
)

curl -X POST -d "$JSON" -H 'content-type: application/json:occi' -v http://localhost:8090/clonenode/ > /dev/null &> /dev/null 
done
